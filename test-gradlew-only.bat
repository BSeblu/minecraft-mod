@echo on
setlocal

echo Setting Java environment...
set "JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-21.0.8.9-hotspot"
set "PATH=C:\Program Files\Eclipse Adoptium\jdk-21.0.8.9-hotspot\bin;%PATH%"

echo.
echo Java version:
java -version

echo.
echo About to run gradlew.bat --stop...
echo If this hangs, press Ctrl+C to abort
gradlew.bat --stop

echo.
echo SUCCESS: gradlew.bat --stop completed!
echo Exit code: %ERRORLEVEL%

echo.
echo Now testing gradlew.bat --version...
gradlew.bat --version

echo.
echo SUCCESS: Both commands completed!

pause