@echo off
REM 1. Запускаем Docker-демон в WSL
wsl -d Ubuntu-22.04 -u root -e bash -c "service docker start"

REM 2. Ждём пока сокет /var/run/docker.sock появится
echo Waiting for Docker to start...
:waitloop
wsl -d Ubuntu-22.04 -u root -e bash -c "test -S /var/run/docker.sock"
if errorlevel 1 (
    timeout /t 2 >nul
    goto waitloop
)

REM 3. Запускаем раннер под пользователем template
wsl -d Ubuntu-22.04 -u template --cd /home/template/actions-runner ./run.sh

pause