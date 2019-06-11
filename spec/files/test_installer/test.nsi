RequestExecutionLevel admin

!define UNINST_KEY \
  "Software\Microsoft\Windows\CurrentVersion\Uninstall\TestProgram"

!include x64.nsh

# define installer name
Name "Test Program"
OutFile "test_program_installer.exe"

# set default install directory
InstallDir "$PROGRAMFILES\TestProgram"

# default section start
Section

  # define output path
  SetOutPath $INSTDIR

  # Add to add/remove programs
  ${If} ${RunningX64}
    SetRegView 64
  ${EndIf}

  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\TestProgram" "DisplayName" "Test Program"
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\TestProgram" "UninstallString" "$\"$INSTDIR\uninstall.exe$\""
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\TestProgram" "QuietUninstallString" "$\"$INSTDIR\uninstall.exe$\" /S"

  # specify file to go in output path
  File test.txt

  # define uninstaller name
  WriteUninstaller $INSTDIR\uninstall.exe

  # Set a custom exit code
  SetErrorLevel 4

SectionEnd

# create a section to define what the uninstaller does.
# the section will always be named "Uninstall"
Section "Uninstall"

  # Always delete uninstaller first
  Delete $INSTDIR\uninstall.exe

  # now delete everything
  RMDir /r $INSTDIR

  # Remove from add/remove programs
  ${If} ${RunningX64}
    SetRegView 64
  ${EndIf}

  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\TestProgram"

SectionEnd
