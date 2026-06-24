@echo off

set DOTNET_CLI_TELEMETRY_OPTOUT=1

for /F "tokens=*" %%f in ('dir /B /AD /S bin') do rmdir /S /Q "%%f"
for /F "tokens=*" %%f in ('dir /B /AD /S obj') do rmdir /S /Q "%%f"
if exist Build rmdir /S /Q Build
if exist Debug rmdir /S /Q Debug
if exist Release rmdir /S /Q Release

mkdir Build
mkdir Build\VNTextProxy

echo Building winmm...
copy /Y VNTextProxy\AlternateProxies\winmm\*.* VNTextProxy
msbuild VNTextProxy\VNTextProxy.vcxproj /p:Platform=Win32 /p:Configuration=Release /p:TargetName=winmm
copy /Y VNTextProxy\Release\winmm.dll Build\VNTextProxy
rmdir /S /Q VNTextProxy\Release

