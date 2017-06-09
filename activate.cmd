:: activation script
@set THISPATH=%~dp0
@echo Checking VCPKG availability at: %THISPATH%
@if NOT EXIST %THISPATH%\.vcpkg-root (
   @echo Error: .vcpkg-root not found, probably wrong location
   @goto end
)

@echo Updating VCPKG_ROOT
@setx VCPKG_ROOT %THISPATH%
@setx VCPKG_ROOT %THISPATH% /M
:end