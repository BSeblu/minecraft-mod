@echo on
setlocal

echo Setting up Java 21 environment
set "JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-21.0.8.9-hotspot"
set "PATH=C:\Program Files\Eclipse Adoptium\jdk-21.0.8.9-hotspot\bin;%PATH%"

echo.
echo Java version check:
java -version

echo.
echo JAVA_HOME is: %JAVA_HOME%

echo.
echo Checking if gradlew.bat exists:
if exist gradlew.bat (
    echo gradlew.bat found
) else (
    echo gradlew.bat NOT found
    pause
    exit /b 1
)

echo.
echo Testing gradlew.bat --version (this might hang):
timeout /t 30 /nobreak >nul & taskkill /f /im java.exe 2>nul
gradlew.bat --version

echo.
echo Exit code from --version: %ERRORLEVEL%

pause