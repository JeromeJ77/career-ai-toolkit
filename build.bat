@echo off
setlocal EnableExtensions EnableDelayedExpansion
cd /d "%~dp0"

set /p VERSION=<VERSION
if "%VERSION%"=="" (
  echo ERROR: VERSION is empty.
  exit /b 1
)

for %%F in ("standalone\interview-coach-standalone.md" "workspace\README.fr.md" "workspace\AGENTS.md" "workspace\data\README.md" "workspace\skills\init-workspace\SKILL.md" "workspace\skills\init-workspace\assets\workspace.template.yaml" "workspace\skills\init-workspace\assets\current-status.template.md" "workspace\skills\init-workspace\assets\professional-profile.template.md" "workspace\skills\init-workspace\assets\external-references.template.md" "workspace\skills\init-workspace\assets\pilot-feedback.template.md" "workspace\skills\interview-coach\SKILL.md" "workspace\skills\interview-coach\references\opportunity-structure-guidelines.md" "workspace\skills\interview-coach\references\simulation-debrief-guidelines.md" "workspace\skills\interview-coach\assets\opportunity.template.md" "workspace\skills\interview-coach\assets\opportunity-analysis.template.md" "workspace\skills\interview-coach\assets\opportunity-current-status.template.md" "workspace\skills\interview-coach\assets\interview.template.md" "workspace\skills\interview-coach\assets\simulation-debrief.template.md") do (
  if not exist %%F (
    echo ERROR: Required file missing: %%~F
    exit /b 1
  )
)

rem Engine/data separation: data\ may only hold README.md files.
for /r "workspace\data" %%F in (*) do (
  if /i not "%%~nxF"=="README.md" (
    echo ERROR: workspace\data may only contain README.md files: %%F
    goto :fail
  )
)

rem Engine/data separation: the workspace root holds only the engine and data\.
for /f "delims=" %%E in ('dir /b "workspace"') do (
  set "ALLOWED="
  for %%A in (AGENTS.md CLAUDE.md README.md README.fr.md skills data) do if /i "%%E"=="%%A" set "ALLOWED=1"
  if not defined ALLOWED (
    echo ERROR: Unexpected entry at the workspace root ^(user data belongs under data\^): %%E
    goto :fail
  )
)

rem Engine/data separation: no initialized working file inside the engine.
for /r "workspace\skills" %%F in (workspace.yaml current-status.md professional-profile.md external-references.md pilot-feedback.md) do (
  if exist "%%F" (
    echo ERROR: Initialized working file found in the engine: %%F
    goto :fail
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

copy /Y "standalone\interview-coach-standalone.md" "dist\interview-coach-standalone-v%VERSION%.md" >nul
copy /Y "workspace\skills\init-workspace\assets\pilot-feedback.template.md" "dist\interview-coach-pilot-feedback-v%VERSION%.md" >nul

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

:fail
exit /b 1
