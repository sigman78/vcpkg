@echo off
for /f "skip=1" %%x in ('wmic os get localdatetime') do if not defined MyDate set MyDate=%%x
set Today=%MyDate:~0,4%-%MyDate:~4,2%-%MyDate:~6,2%
set FileName=vcpkg-dist-%Today%.7z
cmake -E tar c %FileName% --format=7zip -- docs ports scripts triplets vcpkg.exe .vcpkg-root activate.cmd CHANGELOG.md README.md LICENSE.txt 