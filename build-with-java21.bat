@echo on
setlocal

echo Force Java 21 for this session
set "JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-21.0.8.9-hotspot"
set "PATH=C:\Program Files\Eclipse Adoptium\jdk-21.0.8.9-hotspot\bin;%PATH%"

echo.
echo Verify Java version:
java -version

echo.
echo Stop any existing Gradle daemon:
gradlew.bat --stop

echo.
echo Test Gradle version:
gradlew.bat --version

echo.
echo Try clean:
gradlew.bat clean

echo.
echo Try build with verbose output:
gradlew.bat build --info --stacktrace

pause