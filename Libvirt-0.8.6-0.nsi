; Package wide variables
!define APPNAME "Libvirt"
!define APPVERSION "0.8.6"
!define PACKAGEREVISION "0"
!define PUBLISHER "The libvirt.org Community"
!define HOMEPAGE "http://www.libvirt.org"

; Have the base directories for things as variables, for flexibility
!define BUILD_DIR "C:\build"
!define MSYS_SETUP_REPO_DIR "${BUILD_DIR}\msys_setup"
!define INSTALLER_REPO_DIR "${BUILD_DIR}\nsis_libvirt_installer"

; Main Install settings
Name "${APPNAME} ${APPVERSION}"
InstallDir "$PROGRAMFILES\Libvirt"
InstallDirRegKey HKLM "Software\${APPNAME}" ""
OutFile "${BUILD_DIR}\${APPNAME}-${APPVERSION}-${PACKAGEREVISION}.exe"

; Modern interface settings
!include "MUI.nsh"

!define MUI_ABORTWARNING

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "${INSTALLER_REPO_DIR}\licenses\libvirt-0.8.6\COPYING.LIB"
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
	File "${MSYS_SETUP_REPO_DIR}\msys\gather\libvirt\bin\iconv.dll"
	File "${MSYS_SETUP_REPO_DIR}\msys\gather\libvirt\bin\intl.dll"
	File "${MSYS_SETUP_REPO_DIR}\msys\gather\libvirt\bin\libcurl-4.dll"
	File "${MSYS_SETUP_REPO_DIR}\msys\gather\libvirt\bin\libgcrypt-11.dll"
	File "${MSYS_SETUP_REPO_DIR}\msys\gather\libvirt\bin\libgnutls-26.dll"
	File "${MSYS_SETUP_REPO_DIR}\msys\gather\libvirt\bin\libgpg-error-0.dll"
	File "${MSYS_SETUP_REPO_DIR}\msys\gather\libvirt\bin\libportablexdr-0.dll"
	File "${MSYS_SETUP_REPO_DIR}\msys\gather\libvirt\bin\libtasn1-3.dll"
	File "${MSYS_SETUP_REPO_DIR}\msys\gather\libvirt\bin\libvirt-0.dll"
	File "${MSYS_SETUP_REPO_DIR}\msys\gather\libvirt\bin\libvirt-qemu-0.dll"
	File "${MSYS_SETUP_REPO_DIR}\msys\gather\libvirt\bin\libxml2-2.dll"
	File "${MSYS_SETUP_REPO_DIR}\msys\gather\libvirt\bin\virsh.exe"
	File "${MSYS_SETUP_REPO_DIR}\msys\gather\libvirt\bin\zlib1.dll"
	
	; License files
	
	
	;Need to look at including the libcurl license
	
	SetOutPath "$INSTDIR\licenses\"
	File "${INSTALLER_REPO_DIR}\licenses\LICENSES.txt"
	SetOutPath "$INSTDIR\licenses\iconv.dll\"
	File "${INSTALLER_REPO_DIR}\licenses\iconv.dll\COPYING.LIB"
	SetOutPath "$INSTDIR\licenses\intl.dll_gettext-runtime\"
	File "${INSTALLER_REPO_DIR}\licenses\intl.dll_gettext-runtime\COPYING.LIB-2.0"
	File "${INSTALLER_REPO_DIR}\licenses\intl.dll_gettext-runtime\COPYING.LIB-2.1"
	SetOutPath "$INSTDIR\licenses\libgcrypt-11.dll\"
	File "${INSTALLER_REPO_DIR}\licenses\libgcrypt-11.dll\lgpl-2.1.txt"
	SetOutPath "$INSTDIR\licenses\libgnutls-26.dll\"
	File "${INSTALLER_REPO_DIR}\licenses\libgnutls-26.dll\lgpl-2.1.txt"
	SetOutPath "$INSTDIR\licenses\libgpg-error-0.dll\"
	File "${INSTALLER_REPO_DIR}\licenses\libgpg-error-0.dll\COPYING"
	File "${INSTALLER_REPO_DIR}\licenses\libgpg-error-0.dll\COPYING.LIB"
	SetOutPath "$INSTDIR\licenses\libportablexdr-0.dll\"
	File "${INSTALLER_REPO_DIR}\licenses\libportablexdr-0.dll\COPYING"
	File "${INSTALLER_REPO_DIR}\licenses\libportablexdr-0.dll\COPYING.LIB"
	SetOutPath "$INSTDIR\licenses\libtasn1-3.dll\"
	File "${INSTALLER_REPO_DIR}\licenses\libtasn1-3.dll\lgpl-2.1.txt"
	SetOutPath "$INSTDIR\licenses\libvirt-0.8.6\"
	File "${INSTALLER_REPO_DIR}\licenses\libvirt-0.8.6\COPYING.LIB"
	SetOutPath "$INSTDIR\licenses\libxml2-2.dll\"
	File "${INSTALLER_REPO_DIR}\licenses\libxml2-2.dll\COPYING"
	File "${INSTALLER_REPO_DIR}\licenses\libxml2-2.dll\hash.c"
	File "${INSTALLER_REPO_DIR}\licenses\libxml2-2.dll\list.c"
	File "${INSTALLER_REPO_DIR}\licenses\libxml2-2.dll\trio.c"
	File "${INSTALLER_REPO_DIR}\licenses\libxml2-2.dll\trionan.c"
	File "${INSTALLER_REPO_DIR}\licenses\libxml2-2.dll\triostr.c"
	SetOutPath "$INSTDIR\licenses\zlib1.dll\"
	File "${INSTALLER_REPO_DIR}\licenses\zlib1.dll\zlib_license.txt"
	
	; It would probably be useful to create a batch file asking
	; for the connection string, then launch virsh.exe using it
	;CreateShortCut "$DESKTOP\Virsh.lnk" "$INSTDIR\bin\virsh.bat"
	
	CreateDirectory "$SMPROGRAMS\Libvirt"
	;CreateShortCut "$SMPROGRAMS\Libvirt\Virsh.lnk" "$INSTDIR\bin\virsh.bat"
	CreateShortCut "$SMPROGRAMS\Libvirt\Uninstall.lnk" "$INSTDIR\uninstall.exe"

SectionEnd

Section "Development components" Section2

	; Set Section properties
	SetOverwrite on

	; Set Section Files and Shortcuts
	SetOutPath "$INSTDIR\include\libvirt\"
	File "${MSYS_SETUP_REPO_DIR}\msys\gather\libvirt\include\libvirt\libvirt-qemu.h"
	File "${MSYS_SETUP_REPO_DIR}\msys\gather\libvirt\include\libvirt\libvirt.h"
	File "${MSYS_SETUP_REPO_DIR}\msys\gather\libvirt\include\libvirt\virterror.h"
	SetOutPath "$INSTDIR\lib\"
	File "${MSYS_SETUP_REPO_DIR}\msys\gather\libvirt\lib\libvirt-qemu.a"
	File "${MSYS_SETUP_REPO_DIR}\msys\gather\libvirt\lib\libvirt-qemu.dll.a"
	File "${MSYS_SETUP_REPO_DIR}\msys\gather\libvirt\lib\libvirt.a"
	File "${MSYS_SETUP_REPO_DIR}\msys\gather\libvirt\lib\libvirt.dll.a"

SectionEnd

Section "Python bindings" Section3

	; Set Section properties
	SetOverwrite on

	; Set Section Files and Shortcuts
	SetOutPath "$INSTDIR\python\"
	File "${MSYS_SETUP_REPO_DIR}\msys\gather\libvirt\python\libvirt.py"
	File "${MSYS_SETUP_REPO_DIR}\msys\gather\libvirt\python\libvirtmod.pyd"

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
	Delete "$INSTDIR\bin\libcurl-4.dll"
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

	; Clean up license files
	Delete "$INSTDIR\licenses\LICENSES.txt"
	Delete "$INSTDIR\licenses\libvirt-0.8.6\COPYING.LIB"
	Delete "$INSTDIR\licenses\iconv.dll\COPYING.LIB"
	Delete "$INSTDIR\licenses\intl.dll_gettext-runtime\COPYING.LIB-2.0"
	Delete "$INSTDIR\licenses\intl.dll_gettext-runtime\COPYING.LIB-2.1"
	Delete "$INSTDIR\licenses\libgcrypt-11.dll\lgpl-2.1.txt"
	Delete "$INSTDIR\licenses\libgnutls-26.dll\lgpl-2.1.txt"
	Delete "$INSTDIR\licenses\libgpg-error-0.dll\COPYING"
	Delete "$INSTDIR\licenses\libgpg-error-0.dll\COPYING.LIB"
	Delete "$INSTDIR\licenses\libportablexdr-0.dll\COPYING"
	Delete "$INSTDIR\licenses\libportablexdr-0.dll\COPYING.LIB"
	Delete "$INSTDIR\licenses\libtasn1-3.dll\lgpl-2.1.txt"
	Delete "$INSTDIR\licenses\libvirt-0.8.5\COPYING.LIB"
	Delete "$INSTDIR\licenses\libxml2-2.dll\COPYING"
	Delete "$INSTDIR\licenses\libxml2-2.dll\hash.c"
	Delete "$INSTDIR\licenses\libxml2-2.dll\list.c"
	Delete "$INSTDIR\licenses\libxml2-2.dll\trio.c"
	Delete "$INSTDIR\licenses\libxml2-2.dll\trionan.c"
	Delete "$INSTDIR\licenses\libxml2-2.dll\triostr.c"
	Delete "$INSTDIR\licenses\pthreadGC2.dll\COPYING"
	Delete "$INSTDIR\licenses\pthreadGC2.dll\COPYING.LIB"
	Delete "$INSTDIR\licenses\zlib1.dll\zlib_license.txt"

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
	RMDir "$INSTDIR\licenses\zlib1.dll\"
	RMDir "$INSTDIR\licenses\pthreadGC2.dll\"
	RMDir "$INSTDIR\licenses\libxml2-2.dll\"
	RMDir "$INSTDIR\licenses\libvirt-0.8.5\"
	RMDir "$INSTDIR\licenses\libtasn1-3.dll\"
	RMDir "$INSTDIR\licenses\libportablexdr-0.dll\"
	RMDir "$INSTDIR\licenses\libgpg-error-0.dll\"
	RMDir "$INSTDIR\licenses\libgnutls-26.dll\"
	RMDir "$INSTDIR\licenses\libgcrypt-11.dll\"
	RMDir "$INSTDIR\licenses\intl.dll_gettext-runtime\"
	RMDir "$INSTDIR\licenses\iconv.dll\"
	RMDir "$INSTDIR\licenses\libvirt-0.8.6\"
	RMDir "$INSTDIR\licenses\"
	RMDir "$INSTDIR\python\"
	RMDir "$INSTDIR\lib\"
	RMDir "$INSTDIR\include\libvirt\"
	RMDir "$INSTDIR\include\"
	RMDir "$INSTDIR\bin\"
	RMDir "$INSTDIR\"

SectionEnd
