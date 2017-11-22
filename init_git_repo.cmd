@echo off
for /R %%f in (*.gitignore) do ren "%%f" .gitignore
@echo on
git init
git add .
git commit -m "Inital setup"
pause
