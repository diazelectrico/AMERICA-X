#!/bin/bash
# Compila un ejecutable para Linux o macOS (según el sistema donde se ejecute).
cd "$(dirname "$0")"
python3 -m pip install --user pygame pyinstaller
python3 -m PyInstaller --noconfirm --clean americas1490.spec
echo "Ejecutable en dist/America1490"
