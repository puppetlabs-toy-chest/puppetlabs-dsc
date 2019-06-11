@{
    ParameterList = @(
        @{
            Name    = 'RootSDDL'
            Path    = 'RootSDDL'
            Type    = 'String'
            Default = 'O:NSG:BAD:P(A;;GA;;;BA)(A;;GR;;;IU)S:P(AU;FA;GA;;;WD)(AU;SA;GXGW;;;WD)'
            TestVal = 'O:NSG:BAD:P(A;;GA;;;BA)(A;;GR;;;IU)S:P(AU;FA;GA;;;WD)(AU;SA;GA;;;WD)'
            IntTest = $true
        },
        @{
            Name    = 'MaxConnections'
            Path    = 'MaxConnections'
            Type    = 'Uint32'
            Default = 300
            TestVal = 301
            IntTest = $true
        },
        @{
            Name    = 'MaxConcurrentOperationsPerUser'
            Path    = 'MaxConcurrentOperationsPerUser'
            Type    = 'Uint32'
            Default = 1500
            TestVal = 1501
            IntTest = $true
        },
        @{
            Name    = 'EnumerationTimeoutms'
            Path    = 'EnumerationTimeoutms'
            Type    = 'Uint32'
            Default = 240000
            TestVal = 240001
            IntTest = $true
        },
        @{
            Name    = 'MaxPacketRetrievalTimeSeconds'
            Path    = 'MaxPacketRetrievalTimeSeconds'
            Type    = 'Uint32'
            Default = 120
            TestVal = 121
            IntTest = $true
        },
        @{
            Name    = 'AllowUnencrypted'
            Path    = 'AllowUnencrypted'
            Type    = 'Boolean'
            Default = $false
            TestVal = $true
            IntTest = $true
        },
        @{
            Name    = 'AuthBasic'
            Path    = 'Auth\Basic'
            Type    = 'Boolean'
            Default = $false
            TestVal = $true
            IntTest = $false
        },
        @{
            Name    = 'AuthKerberos'
            Path    = 'Auth\Kerberos'
            Type    = 'Boolean'
            Default = $true
            TestVal = $false
            IntTest = $false
        },
        @{
            Name    = 'AuthNegotiate'
            Path    = 'Auth\Negotiate'
            Type    = 'Boolean'
            Default = $true
            TestVal = $false
            IntTest = $false
        },
        @{
            Name    = 'AuthCertificate'
            Path    = 'Auth\Certificate'
            Type    = 'Boolean'
            Default = $false
            TestVal = $true
            IntTest = $true
        },
        @{
            Name    = 'AuthCredSSP'
            Path    = 'Auth\CredSSP'
            Type    = 'Boolean'
            Default = $false
            TestVal = $true
            IntTest = $true
        },
        @{
            Name    = 'AuthCbtHardeningLevel'
            Path    = 'Auth\CbtHardeningLevel'
            Type    = 'String'
            Default = 'relaxed'
            TestVal = 'strict'
            IntTest = $true
        },
        @{
            Name    = 'EnableCompatibilityHttpListener'
            Path    = 'EnableCompatibilityHttpListener'
            Type    = 'Boolean'
            Default = $false
            TestVal = $true
            IntTest = $true
        },
        @{
            Name    = 'EnableCompatibilityHttpsListener'
            Path    = 'EnableCompatibilityHttpsListener'
            Type    = 'Boolean'
            Default = $false
            TestVal = $true
            IntTest = $true
        }
    )
}
