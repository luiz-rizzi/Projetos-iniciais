@echo off
setlocal enabledelayedexpansion

:: Lista de servidores para testar
set SERVIDORES=google.com 8.8.8.8 servidor.local

:: Nome do log com data
set LOG=ping_log_%DATE:/=_%_%TIME::=-%.txt
set LOG=%LOG: =_%

:: Cria o arquivo de log
echo Teste de Conectividade - %DATE% %TIME% > %LOG%
echo --------------------------------------- >> %LOG%

for %%S in (%SERVIDORES%) do (
    echo Testando %%S...
    echo -------------------- >> %LOG%
    echo Ping em %%S: >> %LOG%
    ping -n 4 %%S >> %LOG%
    echo. >> %LOG%
)

echo Testes finalizados. Veja o arquivo: %LOG%
pause
