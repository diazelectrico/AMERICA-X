# América 1000-1490: Imperios antes de Colón

Juego educativo de estrategia por turnos con dados, estética 8 bits, inspirado en RISK, sobre los pueblos de toda
América entre el año 1000 y 1490 d.C. (justo antes de la llegada de los españoles).

- 48 pueblos y civilizaciones (toltecas, mexicas, mayas, purépechas, taínos, kalinago, muiscas, tairona, zenúes, incas,
  chimú, wari, tiwanaku, aymaras, mapuches, guaraníes, tupinambás, cahokia, haudenosaunee, pueblo ancestrales, inuit,
  costa noroeste... y más), cada uno con ficha histórica y rasgos de juego fieles a su capacidad real.
- 176 provincias sobre un mapa pixelado de todo el continente, generado a partir de coordenadas reales.
- 64 eventos históricos fechados que cambian el mapa: colapsos, migraciones, sequías, fundaciones y conquistas.
- 5 mapas de era (1000, 1100, 1200, 1300, 1400) más el de 1490, guardados en el Atlas del juego y como imágenes PNG.
- Un solo jugador contra la computadora. Guardado y carga de partida.
- Corre desde un único ejecutable, sin instalar nada más.

## Cómo obtener el ejecutable para Windows

El juego está escrito en Python + pygame y se convierte en un `.exe` con PyInstaller. El `.exe` resultante **no
necesita Python ni ninguna otra aplicación** en la PC donde se juegue. Python solo hace falta una vez, en la máquina
donde se compila:

1. Instala Python 3.9 o superior desde <https://www.python.org/downloads/> marcando la casilla **"Add Python to PATH"**.
2. Haz doble clic en `build_windows.bat`. Descarga pygame y PyInstaller y compila.
3. El resultado queda en `dist\America1490.exe`. Copia ese archivo a cualquier PC con Windows 10/11 y ejecútalo.

Alternativa sin instalar nada: sube esta carpeta a un repositorio de GitHub. El flujo `.github/workflows/build.yml`
compila automáticamente los ejecutables de Windows, Linux y macOS y los deja como artefactos descargables en la pestaña
*Actions*.

Para Linux o macOS: `./build_linux_mac.sh` (genera `dist/America1490`).

Para jugar directamente desde el código fuente (requiere Python): `python main.py` o `jugar_desde_codigo.bat`.

## Cómo se juega

1. **Elige tu pueblo** entre los que existían en el año 1000. La ficha muestra su historia, sus rasgos y su
   potencial por siglo. Los pueblos que la historia condena (Tula, Tiwanaku, Wari, Cahokia...) son un reto: cuando
   llega su colapso pierdes la mitad de tus ejércitos, pero no desapareces.
2. Cada turno son 10 años y tiene tres fases:
   - **Refuerzos**: haz clic en tus provincias para colocar ejércitos (clic derecho coloca 5).
   - **Ataque**: clic en una provincia tuya con 2 o más ejércitos y luego en una vecina enemiga (marcadas en rojo).
     El atacante tira hasta 3 dados y el defensor hasta 2; se comparan de mayor a menor y el empate favorece al
     defensor. Los rasgos del pueblo, el terreno, las capitales y las tierras natales modifican el dado más alto.
   - **Movimiento**: un solo traslado entre provincias propias conectadas (clic izquierdo mueve todo menos 1, clic
     derecho la mitad).
3. Pulsa **FIN DE TURNO** y los otros 47 pueblos juegan. Los eventos históricos del año aparecen en pantalla con su
   explicación.
4. Al empezar cada siglo se muestra el balance de la era y se guarda el mapa. En 1490 termina la partida y se compara
   tu resultado con la historia real.

Teclas: rueda del ratón = zoom; arrastrar con botón derecho o central = mover el mapa; C = centrar; ESPACIO = siguiente
fase; TAB = cambiar pestaña del panel; A = atlas; G = guardar; F1 o ? = ayuda; F11 = pantalla completa; ESC = cancelar.

Las partidas guardadas y los mapas PNG de cada era quedan en la carpeta `partidas` junto al ejecutable.

## Estructura del proyecto

```
main.py                 punto de entrada
game/ui.py              interfaz 8 bits (menús, mapa, panel educativo, dados, atlas)
game/motor.py           reglas: turnos, combate con dados, IA, eventos, eras, guardar/cargar
game/facciones.py       48 pueblos: rasgos de juego, ficha educativa y potencial por siglo
game/eventos.py         línea de tiempo 1000-1490 con efectos sobre el mapa
game/provincias.py      176 provincias (coordenadas, terreno, pueblos) y rutas marítimas
game/mapa.py            generación de provincias contiguas y adyacencias
game/landmask.py        contorno pixelado de América (generado por tools/rasterize.py)
game/render.py          dibujo del mapa, dados y sprites
game/sonido.py          efectos de sonido sintetizados (sin archivos)
assets/PressStart2P.ttf fuente pixel (licencia OFL)
docs/DISEÑO.md          documento de diseño: reglas, tabla de pueblos, línea de tiempo, fuentes
tools/rasterize.py      regenera el mapa base desde datos de Natural Earth (solo para desarrollo)
```

Todos los datos históricos están en archivos de texto Python fáciles de editar; ver `docs/DISEÑO.md`, sección 10.

## Créditos y licencias

- Código del juego: uso libre para fines educativos.
- Fuente *Press Start 2P* (CodeMan38), SIL Open Font License 1.1.
- Contorno del continente: Natural Earth (dominio público).
- pygame: LGPL. PyInstaller: GPL con excepción para los ejecutables generados.
