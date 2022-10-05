@ECHO OFF

SET curentPath=%cd%

SET param1=%1
SET param2=%2

IF %param1%==init (
    %curentPath%\init_wf.bat %curentPath%
)

IF %param1%==create (
    %curentPath%\new_project.bat %curentPath% %param2%
)

IF %param1%==archiv (
    %curentPath%\new_project.bat %curentPath% %param2%
)

IF %param1%==test (
    CALL:test %curentPath%
)

goto:eof

::--------------------------------------------------------
::-- Function section starts below here
::--------------------------------------------------------

:test
    CD sandbox
    ECHO %~1
    CD ..
goto:eof

