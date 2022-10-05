@echo off

:new

    SET projName=%2
    @REM SET projPath=%homepath%\Documents\projects\working\%projName%
    SET projPath=sandbox\projects\working\%projName%

    MKDIR %projPath%
    
    :: Creation of source directory
    MKDIR %projPath%\src

    :: Creatio of report directory
    MKDIR %projPath%\report

    :: Initialize git in project
    where /q git
    IF ERRORLEVEL 1 (
        ECHO The application is missing. Ensure it is installed and placed in your PATH.
    ) ELSE (
        CD %projPath%
        git init >> %1\log.txt
        COPY NUL README.txt
        COPY NUL .gitignore
    )

    CD %1
    
goto:eof