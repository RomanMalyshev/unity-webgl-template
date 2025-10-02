@echo off
wsl -d Ubuntu-22.04 -u template --cd /home/template/actions-runner ./run.sh
pause