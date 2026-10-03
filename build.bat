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

rem Test kit: the generated sources are committed, the build only packages them.
for %%F in ("test-kit\README.md" "test-kit\scenario.md" "test-kit\guide-testeur.md" "test-kit\tools\make_demo_script.ps1" "test-kit\tools\demo-script-header.md" "test-kit\sources\profile\cv-nadia-berkani.pdf" "test-kit\sources\profile\linkedin-nadia-berkani.pdf" "test-kit\sources\profile\certification-cloud-platform-associate.pdf" "test-kit\sources\profile\notes-complementaires-carriere.docx" "test-kit\sources\profile\livret-formation-architecture-systemes-distribues.pdf" "test-kit\sources\opportunities\001-lumen-pay-offre-developpeuse-backend-senior.pdf" "test-kit\sources\opportunities\002-northwind-ledger-senior-software-engineer.pdf" "test-kit\sources\opportunities\002-northwind-ledger-notes-appel-recruteuse.txt") do (
  if not exist %%F (
    echo ERROR: Required test kit file missing: %%~F
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

rem Engine version marker: generated from VERSION, never kept in workspace\.
>"build\career-ai-workspace\ENGINE-VERSION" echo(%VERSION%
set /p ENGINE_VERSION=<"build\career-ai-workspace\ENGINE-VERSION"
if not "%ENGINE_VERSION%"=="%VERSION%" (
  echo ERROR: ENGINE-VERSION does not match VERSION.
  exit /b 1
)

copy /Y "standalone\interview-coach-standalone.md" "dist\interview-coach-standalone-v%VERSION%.md" >nul
copy /Y "workspace\skills\init-workspace\assets\pilot-feedback.template.md" "dist\interview-coach-pilot-feedback-v%VERSION%.md" >nul

powershell -NoProfile -ExecutionPolicy Bypass -Command "Compress-Archive -Path 'build\career-ai-workspace' -DestinationPath 'dist\career-ai-workspace-v%VERSION%.zip' -Force"
if errorlevel 1 (
  echo ERROR: Could not create workspace ZIP.
  exit /b 1
)

rem Demo and manual-test kit: fictional sources plus the demo script extracted
rem from the master scenario. Never part of the workspace ZIP.
mkdir build\career-ai-test-kit
copy /Y "test-kit\README.md" "build\career-ai-test-kit\README.md" >nul
copy /Y "test-kit\scenario.md" "build\career-ai-test-kit\scenario.md" >nul
copy /Y "test-kit\guide-testeur.md" "build\career-ai-test-kit\guide-testeur.md" >nul
xcopy "test-kit\sources\*" "build\career-ai-test-kit\sources\" /E /I /Q /Y >nul
if errorlevel 1 (
  echo ERROR: Could not copy test kit sources.
  exit /b 1
)
del /q "build\career-ai-test-kit\sources\*.md" "build\career-ai-test-kit\sources\profile\*.md" "build\career-ai-test-kit\sources\opportunities\*.md" 2>nul

powershell -NoProfile -ExecutionPolicy Bypass -File "test-kit\tools\make_demo_script.ps1" -Source "test-kit\scenario.md" -Target "build\career-ai-test-kit\demo-script.md" -Version "%VERSION%"
if errorlevel 1 (
  echo ERROR: Could not generate the demo script.
  exit /b 1
)

powershell -NoProfile -ExecutionPolicy Bypass -Command "Compress-Archive -Path 'build\career-ai-test-kit' -DestinationPath 'dist\career-ai-test-kit-v%VERSION%.zip' -Force"
if errorlevel 1 (
  echo ERROR: Could not create test kit ZIP.
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
