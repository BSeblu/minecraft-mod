@echo on
setlocal

echo Setting Java environment...
set "JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-21.0.8.9-hotspot"
set "PATH=C:\Program Files\Eclipse Adoptium\jdk-21.0.8.9-hotspot\bin;%PATH%"

echo.
echo Java version:
java -version

echo.
echo About to run gradlew.bat --stop with CALL...
call gradlew.bat --stop

echo.
echo SUCCESS: gradlew.bat --stop completed with exit code: %ERRORLEVEL%

echo.
echo Now testing gradlew.bat --version...
call gradlew.bat --version

echo.
echo SUCCESS: gradlew.bat --version completed with exit code: %ERRORLEVEL%

echo.
echo Now testing gradlew.bat build...
call gradlew.bat build

echo.
echo Final exit code: %ERRORLEVEL%

pause