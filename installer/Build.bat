
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Use VS2013's MSBuild to build wpcap.dll, Packet.dll, NPFInstall.exe, NpcapHelper.exe and WlanHelper.exe
call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat"

msbuild "..\packetWin7\Dll\Project\Packet.sln" /t:Build /p:Configuration="Release No NetMon and AirPcap" /p:Platform="Win32"
msbuild "..\packetWin7\Dll\Project\Packet.sln" /t:Build /p:Configuration="Release No NetMon and AirPcap" /p:Platform="x64"
msbuild "..\packetWin7\Dll\Project\Packet.sln" /t:Build /p:Configuration="Release No NetMon and AirPcap(WinPcap Mode)" /p:Platform="Win32"
msbuild "..\packetWin7\Dll\Project\Packet.sln" /t:Build /p:Configuration="Release No NetMon and AirPcap(WinPcap Mode)" /p:Platform="x64"

:: wpcap.sln project depends on the Packet.sln project, because Packet.lib generated by Packet.sln is required to be linked to build wpcap.sln.
msbuild "..\wpcap\libpcap\Win32\Prj\wpcap.sln" /t:Build /p:Configuration="Release" /p:Platform="Win32"
msbuild "..\wpcap\libpcap\Win32\Prj\wpcap.sln" /t:Build /p:Configuration="Release" /p:Platform="x64"

msbuild "..\packetWin7\NPFInstall\NPFInstall.sln" /t:Build /p:Configuration="Release" /p:Platform="Win32"
msbuild "..\packetWin7\NPFInstall\NPFInstall.sln" /t:Build /p:Configuration="Release" /p:Platform="x64"
msbuild "..\packetWin7\NPFInstall\NPFInstall.sln" /t:Build /p:Configuration="Release(WinPcap Mode)" /p:Platform="Win32"
msbuild "..\packetWin7\NPFInstall\NPFInstall.sln" /t:Build /p:Configuration="Release(WinPcap Mode)" /p:Platform="x64"

msbuild "..\packetWin7\Helper\NpcapHelper.sln" /t:Build /p:Configuration="Release" /p:Platform="Win32"
msbuild "..\packetWin7\Helper\NpcapHelper.sln" /t:Build /p:Configuration="Release" /p:Platform="x64"

msbuild "..\packetWin7\WlanHelper\WlanHelper.sln" /t:Build /p:Configuration="Release" /p:Platform="Win32"
msbuild "..\packetWin7\WlanHelper\WlanHelper.sln" /t:Build /p:Configuration="Release" /p:Platform="x64"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Use VS2015's MSBuild to build npf.sys (and npcap.sys)
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat"

:: "%28" is the escape for "(", "%29" is the escape for ")", and "%%" is the escape for "%" itself. Not using escape will cause target error of MSBuild.
msbuild "..\packetWin7\npf\npf.sln" /t:Build /p:Configuration="Vista Release%%28WinPcap Mode%%29" /p:Platform="Win32"
msbuild "..\packetWin7\npf\npf.sln" /t:Build /p:Configuration="Vista Release%%28WinPcap Mode%%29" /p:Platform="x64"
msbuild "..\packetWin7\npf\npf.sln" /t:Build /p:Configuration="Win7 Release%%28WinPcap Mode%%29" /p:Platform="Win32"
msbuild "..\packetWin7\npf\npf.sln" /t:Build /p:Configuration="Win7 Release%%28WinPcap Mode%%29" /p:Platform="x64"
msbuild "..\packetWin7\npf\npf.sln" /t:Build /p:Configuration="Vista Release" /p:Platform="Win32"
msbuild "..\packetWin7\npf\npf.sln" /t:Build /p:Configuration="Vista Release" /p:Platform="x64"
msbuild "..\packetWin7\npf\npf.sln" /t:Build /p:Configuration="Win7 Release" /p:Platform="Win32"
msbuild "..\packetWin7\npf\npf.sln" /t:Build /p:Configuration="Win7 Release" /p:Platform="x64"

pause


