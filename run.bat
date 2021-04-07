@echo off
IF %1 EQU HL (
    REM @cd export/hl
    @hl.exe export/hl/Adventure.hl
    REM @cd ../../
) ELSE IF %1 EQU HLC (
    REM @cd export/hlc
    @call "export/hlc/Adventure.exe"
    REM cd ../../
) ELSE IF %1 EQU BUILD (
    @call "export/build.bat"
)