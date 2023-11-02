
try
{
    "Logging in to Azure..."
    Connect-AzAccount 
}
catch {
    Write-Error -Message $_.Exception
    throw $_.Exception
}

#Get all ARM resources from all resource groups
$ResourceGroups = Get-AzResourceGroup

foreach ($ResourceGroup in $ResourceGroups)
{    
    Write-Output ("Showing resources in resource group " + $ResourceGroup.ResourceGroupName)
    $Resources = Get-AzResource -ResourceGroupName $ResourceGroup.ResourceGroupName
    foreach ($Resource in $Resources)
    {
        Write-Output ($Resource.Name + " of type " +  $Resource.ResourceType)
    }
    Write-Output ("")
}

Get-AzAksCluster -ResourceGroupName group -Name myCluster | Remove-AzAksCluster -Force -WhatIf

Set-Item Env:\SuppressAzurePowerShellBreakingChangeWarnings "true"
Get-AzAksCluster | Remove-AzAksCluster -Force -Confirm:$false -AsJob
