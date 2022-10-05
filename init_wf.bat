@echo off

:init
    
    ECHO Workflow initialisation ... >> %1\log.txt

    : Go to Documents folder
    @REM cd %homepath%\Documents
    CD sandbox

    SET /A counter=0

    SETLOCAL ENABLEDELAYEDEXPANSION

    IF EXIST projects (
        
        CD projects

        IF NOT EXIST archived (
            MKDIR archived
            ECHO archived directorie created. >> %1\log.txt
        ) ELSE (
            ECHO archived directorie already exist. >> %1\log.txt
            SET /A counter=counter+1
        )

        IF NOT EXIST working (
            MKDIR working
            ECHO working directorie created.
        ) ELSE (
            ECHO working directorie already exist. >> %1\log.txt
            SET /A counter+=1
        )

        IF !counter!==2 (
            ECHO Workflow already exist. >> %1\log.txt
        ) ELSE (
            ECHO Workflow was initialized. >> %1\log.txt
        )
        
    ) ELSE (
        MKDIR projects
        MKDIR projects\archived
        MKDIR projects\working

        ECHO Workflow was initialized. >> %1\log.txt
    )

    ENDLOCAL

    CD %1

goto:eof