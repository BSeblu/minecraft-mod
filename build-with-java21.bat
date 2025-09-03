@echo off
setlocal

REM Force Java 21 for this session
set "JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-21.0.8.9-hotspot"
set "PATH=C:\Program Files\Eclipse Adoptium\jdk-21.0.8.9-hotspot\bin;%PATH%"

REM Verify Java version
echo Using Java:
java -version
echo.

REM Stop any existing Gradle daemon
echo Stopping Gradle daemon...
gradlew.bat --stop

REM Test Gradle first
echo Testing Gradle...
gradlew.bat --version

echo.
echo Trying clean...
gradlew.bat clean

echo.
echo Trying build with verbose output...
gradlew.bat build --info --stacktrace

pause