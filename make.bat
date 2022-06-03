@ECHO OFF

Rem Set package name based on the current directory
FOR %%I IN (.) DO SET PACKAGE_NAME=%%~nI%%~xI

Rem Extract version number from AdvancedTabards.toc
FOR /f "delims=" %%a in ('findstr /i /l /c:"Version:" "AdvancedTabards.toc"') DO SET "PACKAGE_VERSION=%%a"
SET "PACKAGE_VERSION=%PACKAGE_VERSION:*Version=%"
FOR /f "delims=:" %%a in ("%PACKAGE_VERSION%") DO SET "PACKAGE_VERSION=%%a"
SET "PACKAGE_VERSION=%PACKAGE_VERSION: =%"

Rem Replace spaces with underscores
SET PACKAGE_VERSION=%PACKAGE_VERSION: =_%

Rem Replace uppercase letters to lowercase (supports the words "alpha", "beta", "dev", "pl" & "rc"
FOR %%a IN ("A=a" "B=b" "C=c" "D=d" "E=e" "H=h" "L=l" "M=m" "P=p" "R=r" "T=t" "V=v") DO (
    CALL SET PACKAGE_VERSION=%%PACKAGE_VERSION:%%~a%%
)

Rem Delete PACKAGE_NAME*.zip if present
IF EXIST %PACKAGE_NAME%*.zip (
  del %PACKAGE_NAME%*.zip
)

Rem Navigate to parent directory
cd ..

Rem Create PACKAGE_NAME.zip
E:\Programme\7-Zip\7z.exe a -tzip -mx=9 %PACKAGE_NAME%_v%PACKAGE_VERSION%.zip .\%PACKAGE_NAME% -xr!%PACKAGE_NAME%.zip -xr!.git -xr!.github -xr!.gitignore -xr!make.bat -xr!.vscode -xr!.idea -xr!README.md

Rem Move PACKAGE_NAME.zip
move /y %PACKAGE_NAME%_v%PACKAGE_VERSION%.zip .\%PACKAGE_NAME%\