# -*- coding: utf-8 -*-
"""América 1000-1490: Imperios antes de Colón. Punto de entrada."""
import os, sys

if __name__ == "__main__":
    os.environ.setdefault("PYGAME_HIDE_SUPPORT_PROMPT", "1")
    sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
    from game.ui import main
    main()
