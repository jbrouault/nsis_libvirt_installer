; Application name
!define APPNAME "Libvirt"
!define APPVERSION "0.8.5"
!define PACKAGEREVISION "0"
!define PUBLISHER "Libvirt.org Community"
!define HOMEPAGE "http://www.libvirt.org"

; Main Install settings
Name "${APPNAME} ${APPVERSION}"
InstallDir "$PROGRAMFILES\Libvirt"
InstallDirRegKey HKLM "Software\${APPNAME}" ""
OutFile "..\git_repos\${APPNAME}-${APPVERSION}-${PACKAGEREVISION}.exe"

; Modern interface settings
!include "MUI.nsh"

!define MUI_ABORTWARNING

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "..\git_repos\msys_setup\msys\gather\libvirt\licences\libvirt-license.txt"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

; Set languages (first is default language)
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_RESERVEFILE_LANGDLL

Section "Virsh" Section1

	; Set Section properties
	SetOverwrite on

	; Set Section Files and Shortcuts
	SetOutPath "$INSTDIR\bin\"
	File "..\git_repos\msys_setup\msys\gather\libvirt\bin\iconv.dll"
	File "..\git_repos\msys_setup\msys\gather\libvirt\bin\intl.dll"
	File "..\git_repos\msys_setup\msys\gather\libvirt\bin\libgcrypt-11.dll"
	File "..\git_repos\msys_setup\msys\gather\libvirt\bin\libgnutls-26.dll"
	File "..\git_repos\msys_setup\msys\gather\libvirt\bin\libgpg-error-0.dll"
	File "..\git_repos\msys_setup\msys\gather\libvirt\bin\libportablexdr-0.dll"
	File "..\git_repos\msys_setup\msys\gather\libvirt\bin\libtasn1-3.dll"
	File "..\git_repos\msys_setup\msys\gather\libvirt\bin\libvirt-0.dll"
	File "..\git_repos\msys_setup\msys\gather\libvirt\bin\libvirt-qemu-0.dll"
	File "..\git_repos\msys_setup\msys\gather\libvirt\bin\libxml2-2.dll"
	File "..\git_repos\msys_setup\msys\gather\libvirt\bin\pthreadGC2.dll"
	File "..\git_repos\msys_setup\msys\gather\libvirt\bin\virsh.exe"
	File "..\git_repos\msys_setup\msys\gather\libvirt\bin\zlib1.dll"
	;CreateShortCut "$DESKTOP\Virsh.lnk" "$INSTDIR\bin\virsh.exe"
	CreateDirectory "$SMPROGRAMS\Libvirt"
	;CreateShortCut "$SMPROGRAMS\Libvirt\Virsh.lnk" "$INSTDIR\bin\virsh.exe"
	CreateShortCut "$SMPROGRAMS\Libvirt\Uninstall.lnk" "$INSTDIR\uninstall.exe"

SectionEnd

Section "Development components" Section2

	; Set Section properties
	SetOverwrite on

	; Set Section Files and Shortcuts
	SetOutPath "$INSTDIR\include\libvirt\"
	File "..\git_repos\msys_setup\msys\gather\libvirt\include\libvirt\libvirt-qemu.h"
	File "..\git_repos\msys_setup\msys\gather\libvirt\include\libvirt\libvirt.h"
	File "..\git_repos\msys_setup\msys\gather\libvirt\include\libvirt\virterror.h"
	SetOutPath "$INSTDIR\lib\"
	File "..\git_repos\msys_setup\msys\gather\libvirt\lib\libvirt-qemu.a"
	File "..\git_repos\msys_setup\msys\gather\libvirt\lib\libvirt-qemu.dll.a"
	File "..\git_repos\msys_setup\msys\gather\libvirt\lib\libvirt.a"
	File "..\git_repos\msys_setup\msys\gather\libvirt\lib\libvirt.dll.a"

SectionEnd

Section "Python bindings" Section3

	; Set Section properties
	SetOverwrite on

	; Set Section Files and Shortcuts
	SetOutPath "$INSTDIR\python\"
	File "..\git_repos\msys_setup\msys\gather\libvirt\python\libvirt.py"
	File "..\git_repos\msys_setup\msys\gather\libvirt\python\libvirtmod.pyd"

SectionEnd

Section -FinishSection

	WriteRegStr HKLM "Software\${APPNAME}" "" "$INSTDIR"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "DisplayName" "${APPNAME}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "DisplayVersion" "${APPVERSION}-${PACKAGEREVISION}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "Publisher" "${PUBLISHER}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "URLInfoAbout" "${HOMEPAGE}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "UninstallString" "$INSTDIR\uninstall.exe"
	WriteUninstaller "$INSTDIR\uninstall.exe"

SectionEnd

; Modern install component descriptions
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
	!insertmacro MUI_DESCRIPTION_TEXT ${Section1} "Command line utility for managing virtual machines using libvirt"
	!insertmacro MUI_DESCRIPTION_TEXT ${Section2} "Libvirt development headers and library files"
	!insertmacro MUI_DESCRIPTION_TEXT ${Section3} "Python bindings"
!insertmacro MUI_FUNCTION_DESCRIPTION_END

;Uninstall section
Section Uninstall

	;Remove from registry...
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}"
	DeleteRegKey HKLM "SOFTWARE\${APPNAME}"

	; Delete self
	Delete "$INSTDIR\uninstall.exe"

	; Delete Shortcuts
;	Delete "$DESKTOP\Virsh.lnk"
;	Delete "$SMPROGRAMS\Libvirt\Virsh.lnk"
	Delete "$SMPROGRAMS\Libvirt\Uninstall.lnk"

	; Clean up Virsh
	Delete "$INSTDIR\bin\iconv.dll"
	Delete "$INSTDIR\bin\intl.dll"
	Delete "$INSTDIR\bin\libgcrypt-11.dll"
	Delete "$INSTDIR\bin\libgnutls-26.dll"
	Delete "$INSTDIR\bin\libgpg-error-0.dll"
	Delete "$INSTDIR\bin\libportablexdr-0.dll"
	Delete "$INSTDIR\bin\libtasn1-3.dll"
	Delete "$INSTDIR\bin\libvirt-0.dll"
	Delete "$INSTDIR\bin\libvirt-qemu-0.dll"
	Delete "$INSTDIR\bin\libxml2-2.dll"
	Delete "$INSTDIR\bin\pthreadGC2.dll"
	Delete "$INSTDIR\bin\virsh.exe"
	Delete "$INSTDIR\bin\zlib1.dll"

	; Clean up Development components
	Delete "$INSTDIR\include\libvirt\libvirt-qemu.h"
	Delete "$INSTDIR\include\libvirt\libvirt.h"
	Delete "$INSTDIR\include\libvirt\virterror.h"
	Delete "$INSTDIR\lib\libvirt-qemu.a"
	Delete "$INSTDIR\lib\libvirt-qemu.dll.a"
	Delete "$INSTDIR\lib\libvirt.a"
	Delete "$INSTDIR\lib\libvirt.dll.a"

	; Clean up Python bindings
	Delete "$INSTDIR\python\libvirt.py"
	Delete "$INSTDIR\python\libvirtmod.pyd"

	; Remove remaining directories
	RMDir "$SMPROGRAMS\Libvirt"
	RMDir "$INSTDIR\python\"
	RMDir "$INSTDIR\lib\"
	RMDir "$INSTDIR\include\libvirt\"
	RMDir "$INSTDIR\include\"
	RMDir "$INSTDIR\bin\"
	RMDir "$INSTDIR\"

SectionEnd
