@echo off
setlocal enabledelayedexpansion

rem Set the output text file name
set output_file=output.txt

rem Clear the existing output file
del %output_file% 2>nul

rem Loop through all .mp4 files in the current directory
for %%i in (*.mp4) do (
    rem Get the full filename
    set "filename=%%i"

    rem Extract the filename without extension
    set "name_only=%%~ni"

    rem Remove the first three characters (assuming they are numbers)
    set "modified_filename=!name_only:~3!"

    rem Remove extension, underscores, parentheses, and &
    set "modified_filename=!modified_filename:.= !"
    set "modified_filename=!modified_filename:_= !"
    set "modified_filename=!modified_filename:(=!"
    set "modified_filename=!modified_filename:)=!"
    set "modified_filename=!modified_filename:&=!"

    rem Enclose the modified filename between double square brackets
    set "modified_filename=[[!modified_filename!]]"

    rem Write the modified filename to the text file
    echo !modified_filename!>>%output_file%
)

echo Process complete. Check %output_file% for the result.
pause
