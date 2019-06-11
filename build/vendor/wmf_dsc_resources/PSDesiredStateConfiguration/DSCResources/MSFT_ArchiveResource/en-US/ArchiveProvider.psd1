# Localized	07/10/2015 05:32 AM (GMT)	303:4.80.0411 	ArchiveProvider.psd1
# Localized ArchiveProvider.psd1

ConvertFrom-StringData @'
###PSLOC
InvalidChecksumArgsMessage=Specifying a Checksum without requesting content validation (the Validate parameter) is not meaningful
InvalidDestinationDirectory=The specified destination directory {0} does not exist or is not a directory
InvalidSourcePath=The specified source file {0} does not exist or is not a file
InvalidNetSourcePath=The specified source file {0} is not a valid net source path
ErrorOpeningExistingFile=An error occurred while opening the file {0} on disk. Please examine the inner exception for details
ErrorOpeningArchiveFile=An error occurred while opening the archive file {0}. Please examine the inner exception for details
ItemExistsButIsWrongType=The named item ({0}) exists but is not the expected type, and Force was not specified
ItemExistsButIsIncorrect=The destination file {0} has been determined not to match the source, but Force has not been specified. Cannot continue
ErrorCopyingToOutstream=An error was encountered while copying the archived file to {0}
PackageUninstalled=The archive at {0} was removed from destination {1}
PackageInstalled=The archive at {0} was unpacked to destination {1}
ConfigurationStarted=The configuration of MSFT_ArchiveResource is starting
ConfigurationFinished=The configuration of MSFT_ArchiveResource has completed
MakeDirectory=Make directory {0}
RemoveFileAndRecreateAsDirectory=Remove existing file {0} and replace it with a directory of the same name
RemoveFile=Remove file {0}
RemoveDirectory=Remove directory {0}
UnzipFile=Unzip archived file to {0}
DestMissingOrIncorrectTypeReason=The destination file {0} was missing or was not a file
DestHasIncorrectHashvalue=The destination file {0} exists but its checksum did not match the origin file
DestShouldNotBeThereReason=The destination file {0} exists but should not
UsingKeyToRetrieveHashValue=Using {0} to retrieve hash value
Nocachevaluefound=No cache value found
Cachevaluefoundreturning=Cache value found, returning {0}
CacheCorrupt=Cache found, but failed to loaded.  Ignoring Cache.
Usingtmpkeytosavehashvalue=Using {0} {1} to save hash value
AbouttocachevalueInputObject=About to cache value {0}
InUpdateCache=In Update-Cache
AddingentryFullNameasacacheentry=Adding {0} as a cache entry
UpdatingCacheObject=Updating CacheObject
Placednewcacheentry=Placed new cache entry
NormalizeChecksumreturningChecksum=Normalize-Checksum returning {0}
PathPathisalreadyaccessiableNomountneeded.=Path {0} is already accessible. No mount needed.
Pathpathisnotavalidatenetpath=Path {0} is not a validate net path.
createpsdrivewithPathpath=create psdrive with Path {0}...
CannotaccessPathPathwithgivenCredential=Cannot access Path {0} with given Credential
Abouttovalidatestandardarguments=About to validate standard arguments
Goingforcacheentries=Going for cache entries
Thecachewasuptodateusingcachetosatisfyrequests=The cache was up to date, using cache to satisfy requests
Abouttoopenthezipfile=About to open the zip file
Cacheupdatedwithentries=Cache updated with {0} entries
Processing=Processing {0}
InTestTargetResourcedestexistsnotusingchecksumscontinuing=In Test-TargetResource: {0} exists, not using checksums, continuing
Notperformingchecksumthefileondiskhasthesamewritetimeasthelasttimeweverifieditscontents=Not performing checksum, the file on disk has the same write time as the last time we verified its contents
destexistsandthehashmatcheseven={0} exists and the hash matches even though the LastModifiedTime did not. Updating cache
InTestTargetResourcedestexistsandtheselectedtimestampChecksummatched=In Test-TargetResource: {0} exists and the selected timestamp {1} matched
RemovePSDriveonRootpsdriveRoot=Remove PSDrive on Root {0}
RemovingDir=Removing {0}
Hashesofexistingandzipfilesmatchremoving=Hashes of existing and zip files match, removing
HashdidnotmatchfilehasbeenmodifiedsinceitwasextractedLeaving=Hash did not match, file has been modified since it was extracted. Leaving
InSetTargetResourceexistsselectedtimestampmatched=In Set-TargetResource: {0} exists and the selected timestamp {1} matched, removing
InSetTargetResourceexistsdtheselectedtimestampnotmatchg=In Set-TargetResource: {0} exists and the selected timestamp {1} did not match, leaving
existingappearstobeanemptydirectoryRemovingit={0} appears to be an empty directory. Removing it
LastWriteTimemtcheswhatwehaverecordnotreexaminingchecksum=LastWriteTime of {0} matches what we have on record, not re-examining {1}
FoundfatdestwheregoingtoplaceoneandhashmatchedContinuing=Found a file at {0} where we were going to place one and hash matched. Continuing
FoundfileatdestwhereweweregoingtoplaceoneandhashdidntmatchItwillbeoverwritten=Found a file at $dest where we were going to place one and hash did not match. It will be overwritten
FoundfileatdestwhereweweregoingtoplaceoneanddoesnotmatchthesourcebutForcewasnotspecifiedErroring=Found a file at {0} where we were going to place one and does not match the source, but Force was not specified. Erroring
InSetTargetResourcedestexistsandtheselectedtimestamp$ChecksumdidnotmatchForcewasspecifiedwewilloverwrite="In Set-TargetResource: {0} exists and the selected timestamp {1} did not match. Force was specified, we will overwrite
FoundafileatdestandtimestampChecksumdoesnotmatchthesourcebutForcewasnotspecifiedErroring=Found a file at {0} and timestamp {1} does not match the source, but Force was not specified. Erroring
FoundadirectoryatdestwhereafileshouldbeRemoving=Found a directory at {0} where a file should be. Removing
FounddirectoryatdestwhereafileshouldbeandForcewasnotspecifiedErroring=Found a directory at {0} where a file should be and Force was not specified. Erroring.
Writingtofiledest=Writing to file {0}
RemovePSDriveonRootdriveRoot=Remove PSDrive on Root {0}
Updatingcache=Updating cache
FolderDirdoesnotexist=Folder {0} does not exist
Examiningdirectorytoseeifitshouldberemoved=Examining {0} to see if it should be removed
InSetTargetResourcedestexistsandtheselectedtimestampChecksummatchedwillleaveit=In Set-TargetResource: {0} exists and the selected timestamp {1} matched, will leave it
###PSLOC

'@
