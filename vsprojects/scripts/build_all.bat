@echo off

@echo Start building solution
"C:\Program Files (x86)\MSBuild\12.0\bin\MSBuild.exe" protobuf.sln /t:Build /p:PlatformToolset=v120 /p:Configuration=Debug /p:Platform=x64
"C:\Program Files (x86)\MSBuild\12.0\bin\MSBuild.exe" protobuf.sln /t:Build /p:PlatformToolset=v120 /p:Configuration=Release /p:Platform=x64
"C:\Program Files (x86)\MSBuild\12.0\bin\MSBuild.exe" protobuf.sln /t:Build /p:PlatformToolset=v120 /p:Configuration=Debug /p:Platform=Win32
"C:\Program Files (x86)\MSBuild\12.0\bin\MSBuild.exe" protobuf.sln /t:Build /p:PlatformToolset=v120 /p:Configuration=Release /p:Platform=Win32
@echo Finished building solution

@echo Start extracting includes
call extract_includes.bat
@echo Finished extracting includes

@echo Start deleting NuGet packages
del *.nupkg
@echo Finished deleting NuGet packages

@echo Start building NuGet package
PowerShell -Command "& { .\scripts\generate_package.ps1 }"
@echo Finished building NuGet package

@echo Start building Zip package
7za a protobuf-v120-2.6.1.6.zip v120\Release\protoc.exe ..\src\google\protobuf\descriptor.proto
@echo Finished building Zip package