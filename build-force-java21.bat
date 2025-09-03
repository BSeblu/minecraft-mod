@echo on
setlocal

echo Forcing ONLY Java 21 to be available...

REM Temporarily rename other Java installations to hide them
if exist "C:\Program Files\Java\jdk-24" (
    echo Hiding Java 24...
    ren "C:\Program Files\Java\jdk-24" "jdk-24-HIDDEN" 2>nul
)

if exist "C:\Program Files\Common Files\Oracle\Java\javapath" (
    echo Hiding Oracle Java...
    ren "C:\Program Files\Common Files\Oracle\Java\javapath" "javapath-HIDDEN" 2>nul
)

if exist "C:\Program Files (x86)\MCreatorEAP2025333716\jdk" (
    echo Hiding MCreator Java...
    ren "C:\Program Files (x86)\MCreatorEAP2025333716\jdk" "jdk-HIDDEN" 2>nul
)

REM Set environment to ONLY use Java 21
set "JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-21.0.8.9-hotspot"
set "PATH=C:\Program Files\Eclipse Adoptium\jdk-21.0.8.9-hotspot\bin;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem"

echo.
echo Current PATH (simplified): %PATH%
echo JAVA_HOME: %JAVA_HOME%

echo.
echo Checking Java version:
java -version

echo.
echo Checking where java command points:
where java

echo.
echo Attempting build...
call gradlew.bat clean build

echo.
echo Build exit code: %ERRORLEVEL%

echo.
echo Restoring hidden Java installations...
if exist "C:\Program Files\Java\jdk-24-HIDDEN" (
    ren "C:\Program Files\Java\jdk-24-HIDDEN" "jdk-24" 2>nul
)
if exist "C:\Program Files\Common Files\Oracle\Java\javapath-HIDDEN" (
    ren "C:\Program Files\Common Files\Oracle\Java\javapath-HIDDEN" "javapath" 2>nul
)
if exist "C:\Program Files (x86)\MCreatorEAP2025333716\jdk-HIDDEN" (
    ren "C:\Program Files (x86)\MCreatorEAP2025333716\jdk-HIDDEN" "jdk" 2>nul
)

echo Done!
pause