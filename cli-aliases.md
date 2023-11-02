- deploy for Deployments
- netpol for Network policies
- ns for Namespaces
- po for PODs
- pv for Persistent Volumes
- pvc for PersistentVolumeClaims
- rs for ReplicaSets
- sa for service accounts
- sve for Services

ky () { echo k "$@" -o yaml; }
kd () { echo k "$@" --dry-run=client -o yaml; }
alias k='kubectl -n $ns' # This helps when namespace in question doesn't have a friendly name
alias kdr= 'kubectl -n $ns -o yaml --dry-run'. # run commands in dry run mode and generate yaml.
alias kgp='kubectl get pods'
export dry='--dry-run=client -o yaml'
