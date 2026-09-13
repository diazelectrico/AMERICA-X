@echo off
REM ============================================================
REM  Compila America1490.exe (no necesita Python para ejecutarse)
REM  Requisitos SOLO para compilar: Python 3.9+ instalado desde python.org
REM  (marcar "Add Python to PATH" en el instalador).
REM ============================================================
cd /d "%~dp0"
python --version >nul 2>&1 || (echo Necesitas instalar Python 3 desde https://www.python.org/downloads/ && pause && exit /b 1)
python -m pip install --upgrade pip
python -m pip install pygame pyinstaller
python -m PyInstaller --noconfirm --clean americas1490.spec
if exist dist\America1490.exe (
  echo.
  echo ==== LISTO: dist\America1490.exe ====
  echo Copia ese archivo a cualquier PC con Windows y ejecutalo. No requiere instalar nada.
) else (
  echo Hubo un error al compilar. Revisa los mensajes anteriores.
)
pause
