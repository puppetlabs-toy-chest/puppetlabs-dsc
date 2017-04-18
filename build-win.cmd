@ECHO OFF

SELOCAL

choco install 7zip -y

ECHO Cleaning...
RD "%~dp0pkg" /s/q

ECHO Building the puppet module...
CALL bundle exec rake build

ECHO Creating tarball...
7za a -y "%~dp0pkg\win.puppetlabs-dsc-1.0.0.tar" "%~dp0pkg\puppetlabs-dsc-1.0.0"

ECHO Creating GZip...
7za a -y "%~dp0pkg\win.puppetlabs-dsc-1.0.0.tar.gz" "%~dp0pkg\win.puppetlabs-dsc-1.0.0.tar"
