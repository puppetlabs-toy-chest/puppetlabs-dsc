# Localized resources for xWaitForCluster

ConvertFrom-StringData @'
    ReturnParameterValues = Returning the values passed as parameters.
    CheckClusterPresent = Checking if cluster {0} is present.
    TargetNodeDomainMissing = Can't find the target node's domain name.
    ClusterPresent = Cluster {0} is present.
    ClusterAbsent = Cluster {0} is NOT present. Will retry again after {1} seconds.
    ClusterAbsentWithDomain = Cluster {0} is NOT present in Active Directory domain '{1}'.
    ClusterAbsentWithError = Cluster {0} is NOT present with error: {1}
    ClusterAbsentAfterTimeOut = Failover cluster {0} was not found after {1} attempts with {2} seconds interval.
    EvaluatingClusterPresent = Evaluating if cluster {0} is present.
'@
