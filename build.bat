@echo off
echo Building EHTTP DLL (32-bit MT static)...

:: 检查是否在x86环境下
if not "%PROCESSOR_ARCHITECTURE%"=="x86" (
    if not "%PROCESSOR_ARCHITEW6432%"=="AMD64" (
        echo Warning: Not in x86 environment. Use "x86 Native Tools Command Prompt" for best results.
    )
)

:: 32位MT静态编译，添加异常处理选项
cl.exe /LD /O2 /MT /EHsc /DNDEBUG ^
  /D_CRT_SECURE_NO_WARNINGS ^
  /DWIN32 ^
  /D_WIN32_WINNT=0x0600 ^
  /arch:IA32 ^
  /I. ^
  /I"miniz-3.0.2" ^
  ehttp.cpp miniz-3.0.2\miniz.c ^
  /Fe:ehttp.dll ^
  /link ^
  /MACHINE:X86 ^
  /DEF:ehttp.def ^
  /SUBSYSTEM:WINDOWS ^
  httpapi.lib ws2_32.lib mswsock.lib iphlpapi.lib winmm.lib ole32.lib shlwapi.lib advapi32.lib

if %ERRORLEVEL% EQU 0 (
    echo Build successful!
    echo.
    echo Files created:
    dir /B *.dll *.lib *.exp 2>nul
    echo.
    echo Checking DLL architecture:
    dumpbin /headers ehttp.dll | findstr /i "machine" 2>nul || echo Could not run dumpbin - DLL built successfully anyway
) else (
    echo Build failed with error code %ERRORLEVEL%
)
