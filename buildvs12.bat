rem echo off
mkdir ..\nitrojs_build_vs12
pushd ..\nitrojs_build_vs12
cmake -G"Visual Studio 12 2013 Win64" ..\nitrojs
REM call "%VS120COMNTOOLS%vsvars32.bat"
REM MSBuild nitrojs.sln /maxcpucount /p:Configuration=Release
REM copy Release\nitro.exe ..\..\nitro\bin
popd

