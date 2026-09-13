@echo off
REM Ejecuta el juego directamente desde el codigo fuente (requiere Python + pygame).
cd /d "%~dp0"
python -m pip install pygame >nul 2>&1
python main.py
