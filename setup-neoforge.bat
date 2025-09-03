@echo on
setlocal

echo Setting up NeoForge development environment...

REM Hide other Java versions temporarily
if exist "C:\Program Files\Java\jdk-24" (
    ren "C:\Program Files\Java\jdk-24" "jdk-24-HIDDEN" 2>nul
)
if exist "C:\Program Files\Common Files\Oracle\Java\javapath" (
    ren "C:\Program Files\Common Files\Oracle\Java\javapath" "javapath-HIDDEN" 2>nul
)
if exist "C:\Program Files (x86)\MCreatorEAP2025333716\jdk" (
    ren "C:\Program Files (x86)\MCreatorEAP2025333716\jdk" "jdk-HIDDEN" 2>nul
)

REM Force Java 21 only
set "JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-21.0.8.9-hotspot"
set "PATH=C:\Program Files\Eclipse Adoptium\jdk-21.0.8.9-hotspot\bin;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem"

echo.
echo Java version:
java -version

echo.
echo Step 1: Clean everything
call gradlew.bat clean

echo.
echo Step 2: Setup NeoForge workspace (this may take several minutes)
call gradlew.bat setupDecompWorkspace

echo.
echo Step 3: Generate IDE files
call gradlew.bat genIdeSources

echo.
echo Step 4: Try build again
call gradlew.bat build

echo.
echo Setup complete! Exit code: %ERRORLEVEL%

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

pause