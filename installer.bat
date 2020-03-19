@echo off
cls
@echo Executando a instalacao do chocolatey...

Get-ExecutionPolicy

@echo Se retornou Restricted
@echo.
@echo Digite [1] para exec. Bypass para ignorar a política para instalar as coisas ou
@echo.
@echo Digite [2] AllSigned para um pouco mais de segurança

set /p opcao = Digite a opcao desejada...

if "%opcao%" == "1" goto opcao1
if "%opcao%" == "2" goto opcao2

:opcao1
Set-ExecutionPolicy Bypass -Scope Process
goto installChoco

:opcao2
Set-ExecutionPolicy AllSigned
goto installChoco

:installChoco
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
goto installApps

:installApps
@echo.
@echo Instalando Chrome...
choco install googlechrome

@echo.
@echo Instalando JAVA...
choco install jre8

@echo.
@echo Instalando Firefox...
choco install firefox

@echo.
@echo Instalando FilleZilla...
choco install filezilla

@echo.
@echo Instalando SumatraPDF...
choco install sumatrapdf

@echo.
@echo Instalando Anydesk...
choco install anydesk

goto finish

:finish
echo.
echo Operacao executada com sucesso!
echo.
echo Pressione qualquer tecla para encerrar...
pause > n