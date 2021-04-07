@echo off
IF NOT DEFINED __ARCH__ (
    @call vcsetup x64
)
@cl.exe /Ox /Fo"%~dp0hlc-bin/obj" /Fe"%~dp0hlc/Adventure.exe" -I"%HASHLINK%/include" -I "%~dp0hlc-bin/code" "%~dp0hlc-bin/code/main.c" /link /libpath:%HASHLINK% ui.lib directx.lib openal.lib fmt.lib libhl.lib /SUBSYSTEM:WINDOWS
