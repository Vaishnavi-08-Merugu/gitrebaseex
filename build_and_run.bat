@echo off
setlocal enabledelayedexpansion

REM Clean/create artifacts directory
if exist artifacts (
  rmdir /s /q artifacts
)
mkdir artifacts

REM Compile all Java files recursively
for /r %%f in (*.java) do (
  echo Compiling %%f
  javac "%%f"
  if errorlevel 1 (
    echo Compilation failed for %%f
    exit /b 1
  )
)

REM Run the main class - change Student if needed
echo Running Student...
java Student > artifacts/stdout.txt 2> artifacts/stderr.txt
if errorlevel 1 (
  echo Program returned non-zero exit code. See artifacts\stderr.txt
)

REM Copy .class files into artifacts (preserve structure)
for /r %%c in (*.class) do (
  set "source=%%~pc"
  set "dest=artifacts%%~pc"
  if not exist "!dest!" mkdir "!dest!"
  copy "%%c" "!dest!" >nul
)

REM Copy known outputs to artifacts
if exist student_output.txt copy student_output.txt artifacts\

echo Build+Run finished. Artifacts in %CD%\artifacts
endlocal
exit /b 0
