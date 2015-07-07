# Localized    05/09/2014 08:36 PM (GMT)    303:4.80.0411     MSFT_xGroupResource.strings.psd1
# Localized resources for MSFT_xGroupResource

ConvertFrom-StringData @'
###PSLOC
GroupWithName=Group: {0}
RemoveOperation=Remove
AddOperation=Add
SetOperation=Set
ConfigurationStarted=Configuration of group {0} started.
ConfigurationCompleted=Configuration of group {0} completed successfully.
GroupCreated=Group {0} created successfully.
GroupUpdated=Group {0} properties updated successfully.
GroupRemoved=Group {0} removed successfully.
NoConfigurationRequired=Group {0} exists on this node with the desired properties. No action required.
NoConfigurationRequiredGroupDoesNotExist=Group {0} does not exist on this node. No action required.
CouldNotFindPrincipal=Could not find a principal with the provided name [{0}]
MembersAndIncludeExcludeConflict=The {0} and {1} and/or {2} parameters conflict. The {0} parameter should not be used in any combination with the {1} and {2} parameters.
MembersIsNull=The Members parameter value is null. The {0} parameter must be provided if neither {1} nor {2} is provided.
IncludeAndExcludeConflict=The principal {0} is included in both {1} and {2} parameter values. The same principal must not be included in both {1} and {2} parameter values.
InvalidGroupName=The name {0} cannot be used. Names may not consist entirely of periods and/or spaces, or contain these characters: {1}
GroupExists=A group with the name {0} exists.
GroupDoesNotExist=A group with the name {0} does not exist.
PropertyMismatch=The value of the {0} property is expected to be {1} but it is {2}.
MembersNumberMismatch=Property {0}. The number of provided unique group members {1} is different from the number of actual group members {2}.
MembersMemberMismatch=At least one member {0} of the provided {1} parameter does not have a match in the existing group {2}.
MemberToExcludeMatch=At least one member {0} of the provided {1} parameter has a match in the existing group {2}.
ResolvingLocalAccount=Resolving {0} as a local account.
RedirectDomain=Redirecting to domain {0} for account {1}.
ResolvingDomainAccount=Resolving {0} in the {1} domain.
ResolvingUser=Resolving {0} as a user.
ResolvingGroup=Resolving {0} as a group.
ResolvingComputer=Resolving {0} as a computer.
DomainCredentialsRequired=Credentials are required to resolve the domain account {0}.
###PSLOC

'@


