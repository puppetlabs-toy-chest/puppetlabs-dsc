ConvertFrom-StringData @'
    AdditionalOcspPathsFound     = Not in desired state, additional OCSP URI paths found, "{0}", running Set.
    AddOcspUriPaths              = Adding "{0}" to desired OCSP URI paths.
    DesiredOcspPathsMissing      = Not in desired state, missing desired OCSP URI paths, "{0}", running Set.
    EnsureAbsentButUriPathsExist = Not in desired state, OCSP URI paths should be Absent, but found "{0}".
    GetOcspUriPaths              = Getting all OCSP URI paths.
    OcspPathsNull                = Not in desired state, OCSP URI paths empty, missing "{0}", running Set.
    RemoveOcspUriPaths           = Removing "{0}" OCSP URI paths.
    RestartService               = Preparing to restart the CertSvc for changes to take affect.
    IncorrectOcspUriFound        = Not in desired state, OCSP URI path incorrect, found "{0}", running Set.
'@
