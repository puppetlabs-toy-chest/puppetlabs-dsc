# Localized resources for xCluster

ConvertFrom-StringData @'
    CheckClusterPresent = Checking if cluster {0} is present.
    ClusterPresent = Cluster {0} is present.
    ClusterAbsent = Cluster {0} is NOT present.
    ClusterCreated = Created cluster {0}.
    AddNodeToCluster = Adding node {0} to cluster {1}.
    RemoveOfflineNodeFromCluster = Node {0} is down, need to remove it from the cluster {1}.
    AddNodeToClusterSuccessful = Added node {0} to cluster {1}.
    CheckClusterNodeIsUp = Checking if the node {0} is a member of the cluster {1}, and so that node status is 'Up'.
    ClusterNodeIsDown = Node {0} is in the cluster {1} but the status is not 'Up'. Node will be treated as NOT being a member of the cluster {1}.
    ClusterNodePresent = Cluster node {0} is a member of cluster {1}.
    ClusterNodeAbsent = Cluster node {0} is NOT a member of cluster {1}.
    ClusterAbsentWithError = Cluster {0} is NOT present with error: {1}
    TargetNodeDomainMissing = Can't find the target node's domain name.
    ClusterNameNotFound = Can't find the cluster {0}.
    FailedCreatingCluster = Cluster creation failed. Please verify output of 'Get-Cluster' command.
    UnableToImpersonateUser = Can't logon as user {0}.
    UnableToCloseToken = Can't close impersonation token {0}.
    GetClusterInformation = Retrieving information for cluster {0}.
'@
