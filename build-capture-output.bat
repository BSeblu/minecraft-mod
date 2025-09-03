@echo on
setlocal

echo Starting build process... > build-output.log
echo. >> build-output.log

echo Setting Java environment... >> build-output.log
set "JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-21.0.8.9-hotspot"
set "PATH=C:\Program Files\Eclipse Adoptium\jdk-21.0.8.9-hotspot\bin;%PATH%"

echo Checking Java version... >> build-output.log
java -version >> build-output.log 2>&1

echo. >> build-output.log
echo Stopping Gradle daemon... >> build-output.log
gradlew.bat --stop >> build-output.log 2>&1

echo. >> build-output.log
echo Testing Gradle version... >> build-output.log
gradlew.bat --version >> build-output.log 2>&1

echo. >> build-output.log
echo Running clean... >> build-output.log
gradlew.bat clean >> build-output.log 2>&1

echo. >> build-output.log
echo Running build... >> build-output.log
gradlew.bat build >> build-output.log 2>&1

echo. >> build-output.log
echo Build finished with exit code: %ERRORLEVEL% >> build-output.log

echo Build complete! Check build-output.log for details.
echo Exit code was: %ERRORLEVEL%
pause