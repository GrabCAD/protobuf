@echo off

"C:\Program Files (x86)\MSBuild\12.0\bin\MSBuild.exe" protobuf.sln /t:Build /p:PlatformToolset=v120 /p:Configuration=Debug /p:Platform=x64
"C:\Program Files (x86)\MSBuild\12.0\bin\MSBuild.exe" protobuf.sln /t:Build /p:PlatformToolset=v120 /p:Configuration=Release /p:Platform=x64
"C:\Program Files (x86)\MSBuild\12.0\bin\MSBuild.exe" protobuf.sln /t:Build /p:PlatformToolset=v120 /p:Configuration=Debug /p:Platform=Win32
"C:\Program Files (x86)\MSBuild\12.0\bin\MSBuild.exe" protobuf.sln /t:Build /p:PlatformToolset=v120 /p:Configuration=Release /p:Platform=Win32

extract_includes

PowerShell -Command "& { .\scripts\generate_package.ps1 }"
