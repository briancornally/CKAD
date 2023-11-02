<#
.SYNOPSIS
	create snapshot, or if one already exists revert to latest snapshot 
	
.DESCRIPTION
	if no existing snapshot then snapshot VM; else revert to latest snapshot
    note: for revert, VM must be removed to clear storage lease & then recreated
    note2: snapshots can be created with VM powered-on. However snapshot created on a busy database classic VM was once noted as corrupted & recovery was not possible. 
	
.NOTES
    Author: Brian Cornally
#>
# create snapshot if it doesn't exist

$VerbosePreference='SilentlyContinue'
#$VerbosePreference='Continue'
$ErrorActionPreference = 'Stop'
$stopwatch=[system.diagnostics.stopwatch]::startNew()

if ([string]::IsNullOrEmpty($(Get-AzureRmContext).Account)) {Login-AzureRmAccount}

# Set variable values
$vmName = "c1-node3"
$resourceGroupName = "k8s-bm"

# get & save configuration to a file
$vm=Get-AzVM -ResourceGroupName $ResourceGroupName -Name $vmName 
$vmold=$vm
$vm | ConvertTo-Json -Depth 99 | out-file "$vmName.json"
code "$vmName.json"
$vmConfig=Get-Content "$vmName.json" | ConvertFrom-Json
#$vmConfig | out-file "$vmName.txt"

# infer settings
$location = $vmConfig.Location
$vmSize = $vmConfig.HardwareProfile.VmSize
$NetworkInterfaceId=$vmConfig.NetworkProfile.NetworkInterfaces.Id
$NetworkInterfaceId=$vm.NetworkProfile.NetworkInterfaces.Id

$osVhdUri=$vm.StorageProfile.OsDisk.Vhd.Uri
$osVhdName=$osVhdUri.split("/")[-1]
$StorageAccountName=$osVhdUri.split("/")[2].split(".")[0]

$Container="vhds"

<#
write-host "power off VM..." -ForegroundColor Green
Stop-AzVM -ResourceGroupName $resourceGroupName -Name $vmName -Force -Verbose
#>

$sa=(Get-AzStorageAccountKey -storageaccountname $StorageAccountName -ResourceGroupName $ResourceGroupName -ErrorAction Stop)
$StorageKey = $sa.GetValue(0) | % Value
$Context = New-AzStorageContext -StorageAccountName $StorageAccountName -StorageAccountKey $StorageKey 
$Blob=Get-AzStorageContainer -Context $Context -Name $Container | Get-AzStorageBlob | ? Name -match $osVhdName | ? -Property SnapshotTime -EQ $null 
$Snapshots=Get-AzStorageContainer -Context $Context -Name $Container | Get-AzStorageBlob | ? Name -match $osVhdName | ? -Property SnapshotTime
if ($null -eq $Snapshots) {
    write-host "no existing snapshot. create one" -ForegroundColor Green
    $Blob.ICloudBlob.CreateSnapshot()
} else {
    write-host "existing snapshot detected. reverting to latest" -ForegroundColor Green

    write-host "remove vm to clear storage lease ..." -ForegroundColor Green
    remove-AzVM -ResourceGroupName $resourceGroupName -Name $vmName -Force -Verbose

    write-host "overwrite original blob" -ForegroundColor Green
    $snapshot = Get-AzStorageContainer -Context $Context -Name $Container | Get-AzStorageBlob | Where-Object -Property SnapshotTime | Select-Object -Last 1 # most recent snapshot
    Start-AzStorageBlobCopy -ICloudBlob $snapshot.ICloudBlob -DestICloudBlob $Blob.ICloudBlob -Context $Context -force
    $Blob.ICloudBlob.CopyState # copy is immediate

    write-host "re-create VM ..." -ForegroundColor Green
    $nic=get-AzNetworkInterface -ResourceId $NetworkInterfaceId

    Write-Verbose "Creating VM $vmName Config"
    $vm = $null
    $vm = New-AzVMConfig -vmName $vmName -VMSize $vmSize
	#  | Set-AzureRmVMOperatingSystem -Linux 
    $vm = Add-AzVMNetworkInterface -VM $vm -Id $nic.Id
    $vm = Set-AzVMOSDisk -VM $vm -Name $osVhdName -VhdUri $osVhdUri -CreateOption Attach -Linux

    Write-Verbose "Creating VM $vmName ..."
    $result = New-AzVM -ResourceGroupName $resourceGroupName -Location $location -VM $vm  
    if ($result.StatusCode -ne "OK") {
        throw "failed: suggest retry the New-AzVM command" 
        $result
    }
}
$stopwatch.stop
"completed in {0:N0} minutes" -f $stopwatch.Elapsed.TotalMinutes