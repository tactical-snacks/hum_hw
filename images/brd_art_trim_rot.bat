@ECHO OFF
ECHO Trim, Rotate, Rename PNG's using Imagemagick
ECHO created 2023-01-14 by tactical snacks
ECHO.
ECHO to use, name board top image file with ending of "topp.png" and
ECHO name board bottom image file with ending of "bott.png". images
ECHO will be auto-cropped, the bot image rotated 180deg and renamed.
ECHO ---------------------------------------------------------------
ECHO.

Setlocal enabledelayedexpansion

:: trim and rotate, overwrite
ECHO editing images ...
forfiles /m *topp.png /c "cmd /c magick @file -trim @file"
forfiles /m *bott.png /c "cmd /c magick @file -rotate 180 -trim @file"
ECHO edit complete
ECHO.

:: rename, i.e. replace pp with p, tt with t
ECHO renaming files ...
Set "Pattern=pp.png"
Set "Replace=p.png"

For %%a in (*topp.png) Do (
  Set "File=%%a"
  Ren "%%a" "!File:%Pattern%=%Replace%!"
  ECHO renamed top file
)


Set "Pattern=tt.png"
Set "Replace=t.png"

For %%a in (*bott.png) Do (
  Set "File=%%a"
  Ren "%%a" "!File:%Pattern%=%Replace%!"
  ECHO renamed bot file
)

ECHO.
ECHO process complete
ECHO.

PAUSE