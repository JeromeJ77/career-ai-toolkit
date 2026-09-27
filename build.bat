@echo off
setlocal EnableExtensions EnableDelayedExpansion
cd /d "%~dp0"

set /p VERSION=<VERSION
if "%VERSION%"=="" (
  echo ERROR: VERSION is empty.
  exit /b 1
)

for %%F in ("standalone\interview-coach-standalone.md" "docs\pilot-feedback.template.md" "workspace\README.fr.md" "workspace\AGENTS.md" "workspace\current-status.md" "workspace\profile\professional-profile.md" "workspace\skills\interview-coach\SKILL.md" "workspace\skills\interview-coach\references\opportunity-structure-guidelines.md" "workspace\skills\interview-coach\assets\opportunity.template.md" "workspace\skills\interview-coach\assets\opportunity-analysis.template.md" "workspace\skills\interview-coach\assets\opportunity-current-status.template.md" "workspace\skills\interview-coach\assets\interview.template.md") do (
  if not exist %%F (
    echo ERROR: Required file missing: %%~F
    exit /b 1
  )
)

if exist build rmdir /s /q build
if exist dist rmdir /s /q dist
mkdir build\career-ai-workspace
mkdir dist

xcopy "workspace\*" "build\career-ai-workspace\" /E /I /Q /Y >nul
if errorlevel 1 (
  echo ERROR: Could not copy workspace files.
  exit /b 1
)

copy /Y "docs\pilot-feedback.template.md" "build\career-ai-workspace\feedback\pilot-feedback.md" >nul
copy /Y "standalone\interview-coach-standalone.md" "dist\interview-coach-standalone-v%VERSION%.md" >nul
copy /Y "docs\pilot-feedback.template.md" "dist\interview-coach-pilot-feedback-v%VERSION%.md" >nul

powershell -NoProfile -ExecutionPolicy Bypass -Command "Compress-Archive -Path 'build\career-ai-workspace' -DestinationPath 'dist\career-ai-workspace-v%VERSION%.zip' -Force"
if errorlevel 1 (
  echo ERROR: Could not create workspace ZIP.
  exit /b 1
)

rmdir /s /q build

echo.
echo Build completed successfully.
echo Artifacts:
for %%F in (dist\*) do echo   %%F ^(%%~zF bytes^)
exit /b 0
