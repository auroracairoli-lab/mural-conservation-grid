@echo off
setlocal enabledelayedexpansion

REM === CHECK FOR IMAGEMAGICK ===
where magick >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo.
    echo WARNING: ImageMagick is not installed or not found in PATH!
    echo Please install ImageMagick from: https://imagemagick.org/script/download.php
    echo.
    pause
    exit /b 1
)

REM === CONFIGURATION ===
set color=white
set thickness=1
set grid_lines=10

if not exist "Output" mkdir "Output"

for %%F in ("Input\*.jpg" "Input\*.png" "Input\*.jpeg") do (
    echo Processing %%F...

    REM Get image dimensions
    for /f "tokens=1,2" %%A in ('magick identify -format "%%w %%h" "%%F"') do (
        set width=%%A
        set height=%%B
    )

    REM Output width and height to verify parsing
    echo Width: !width!
    echo Height: !height!

    REM Determine which side is larger and set the line type accordingly
    if !width! geq !height! (
        REM Larger side is width, draw vertical lines
        set large_side=!width!
        set small_side=!height!
        set line_type=vertical
    ) else (
        REM Larger side is height, draw horizontal lines
        set large_side=!height!
        set small_side=!width!
        set line_type=horizontal
    )

    REM Calculate the spacing for the larger side (10 lines)
    set /a large_spacing=!large_side!/!grid_lines!

    REM Correctly round the number of lines for the smaller side
    REM Add half the spacing before dividing to round the result
    set /a half_large_spacing = !large_spacing!/2
    set /a increased_small_side = !small_side! + !half_large_spacing!
    set /a small_lines=!increased_small_side! / !large_spacing!

    REM Initialize draw commands
    set drawcmd=

    REM Draw vertical lines (only if width > height)
    if "!line_type!"=="vertical" (
        REM Draw 10 vertical lines on the larger side (width)
        for /l %%X in (0,!large_spacing!,!width!) do (
            set drawcmd=!drawcmd! -draw "line %%X,0 %%X,!height!"
        )

        REM Draw lines on the smaller side (height)
        set /a small_spacing=!height!/!small_lines!
        for /l %%Y in (0,!small_spacing!,!height!) do (
            set drawcmd=!drawcmd! -draw "line 0,%%Y !width!,%%Y"
        )
    )

    REM Draw horizontal lines (only if height > width)
    if "!line_type!"=="horizontal" (
        REM Draw 10 horizontal lines on the larger side (height)
        for /l %%Y in (0,!large_spacing!,!height!) do (
            set drawcmd=!drawcmd! -draw "line 0,%%Y !width!,%%Y"
        )

        REM Draw lines on the smaller side (width)
        set /a small_spacing=!width!/!small_lines!
        for /l %%X in (0,!small_spacing!,!width!) do (
            set drawcmd=!drawcmd! -draw "line %%X,0 %%X,!height!"
        )
    )

    REM Apply the grid to the image
    set /a corrected_thickness = !thickness! * !large_side! / 500
   echo !corrected_thickness!
    magick "%%F" -stroke %color% -strokewidth !corrected_thickness! -fill none !drawcmd! "Output\%%~nF_grid%%~xF"
)

echo Done!
pause
