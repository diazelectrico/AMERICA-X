# -*- mode: python ; coding: utf-8 -*-
# Especificación de PyInstaller: genera un ejecutable único que no necesita Python instalado.
import os
block_cipher = None
a = Analysis(
    ['main.py'],
    pathex=[os.path.abspath('.')],
    binaries=[],
    datas=[('assets', 'assets')],
    hiddenimports=['pygame'],
    hookspath=[],
    runtime_hooks=[],
    excludes=['tkinter', 'numpy', 'shapely', 'unittest'],
    cipher=block_cipher,
    noarchive=False,
)
pyz = PYZ(a.pure, a.zipped_data, cipher=block_cipher)
exe = EXE(
    pyz, a.scripts, a.binaries, a.zipfiles, a.datas, [],
    name='America1490',
    debug=False,
    strip=False,
    upx=False,
    console=False,
    icon=None,
)
