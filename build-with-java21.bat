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

REM Clean and build
echo Building project...
gradlew.bat clean build

pause