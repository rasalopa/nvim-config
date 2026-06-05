# ⌨️ Chuleta de atajos

**Modificador según el sistema:**  Mac → `⌘ (Cmd)`  ·  Windows/Linux → `Alt`
Ábrela dentro de Neovim con  `:Atajos`  ó  `⌘/` (Mac) / `Alt+/` (PC) / `<Espacio>?`

> Los atajos con `⌘`/`Alt` necesitan **Neovide**. Dentro de una terminal usa los de
> `<Espacio>` (la barra espaciadora), que funcionan en todas partes.

---

## 🪟 General

| Acción                          | Mac   | PC      |
|---------------------------------|-------|---------|
| Abrir esta chuleta              | `⌘/`  | `Alt+/` |
| Menú de atajos (which-key)      | `⌘K`  | `Alt+k` |
| Abrir la config                 | `⌘,`  | `Alt+,` |
| Salir                           | `⌘Q`  | `Alt+q` |

## 🗂️ Pestañas

| Acción                          | Mac        | PC             |
|---------------------------------|------------|----------------|
| Pestaña nueva                   | `⌘T`       | `Alt+t`        |
| Archivo nuevo                   | `⌘E`       | `Alt+e`        |
| Cerrar panel / pestaña          | `⌘W`       | `Alt+w`        |
| Pestaña siguiente / anterior    | `⌃Tab` / `⌃⇧Tab` | (igual)  |
| Ir a la pestaña 1–9             | `⌘1`–`⌘9`  | `Alt+1`–`Alt+9`|

## ⊞ Paneles (splits)

| Acción                          | Mac    | PC            |
|---------------------------------|--------|---------------|
| Dividir panel → derecha         | `⌘D`   | `Alt+d`       |
| Dividir panel ↓ abajo           | `⌘⇧D`  | `Alt+Shift+D` |
| Foco panel siguiente            | `⌘]`   | `Alt+]`       |
| Foco panel anterior             | `⌘[`   | `Alt+[`       |

## 👁️ Vista

| Acción                          | Mac    | PC            |
|---------------------------------|--------|---------------|
| Explorador de archivos          | `⌘B`   | `Alt+b`       |
| Foco en el explorador           | `⌘⇧E`  | `Alt+Shift+E` |
| Zoom + / − / reset              | `⌘=` `⌘-` `⌘0` | `Alt+=` `Alt+-` `Alt+0` |

## 🔍 Búsqueda

| Acción                          | Mac    | PC            |
|---------------------------------|--------|---------------|
| Abrir archivo (quick open)      | `⌘P`   | `Alt+p`       |
| Buscar texto en el proyecto     | `⌘⇧F`  | `Alt+Shift+F` |
| Buscar en el archivo actual     | `⌘F`   | `Alt+f`       |

## 🤖 IA y Terminal

| Acción                          | Mac    | PC          |
|---------------------------------|--------|-------------|
| Claude (IA)                     | `⌘I`   | `Alt+i`     |
| Terminal flotante               | `⌘R`   | `Alt+r`     |
| Git (lazygit)                   | `⌘G`   | `Alt+g`     |
| Sesión SSH                      | `:Ssh usuario@servidor`        ||
| Salir de una terminal           | `Esc` `Esc` (dos veces)        ||

## ✏️ Editor y portapapeles

| Acción                          | Mac    | PC            |
|---------------------------------|--------|---------------|
| Guardar                         | `⌘S`   | `Alt+s`       |
| Deshacer / Rehacer              | `⌘Z` / `⌘⇧Z` | `Alt+z` / `Alt+Shift+Z` |
| Copiar / Cortar / Pegar         | `⌘C` `⌘X` `⌘V` | `Alt+c` `Alt+x` `Alt+v` |
| Seleccionar todo                | `⌘A`   | `Alt+a`       |

---

## 🚀 Universal — `<Espacio>` (funciona también en terminal)

Pulsa `Espacio` y espera: aparece el menú con todo. Grupos principales:

| Prefijo        | Grupo                                                        |
|----------------|-------------------------------------------------------------|
| `<Espacio>f`   | **Buscar** — `ff` archivos · `fg` texto · `fr` recientes · `fb` buffers |
| `<Espacio>g`   | **Git** — `gs` status · `gc` commits · `gb` ramas           |
| `<Espacio>e`   | **Explorador** — `ee` abrir/cerrar · `ef` foco              |
| `<Espacio>c`   | **Claude/Terminal** — `cc` Claude · `cf` terminal · `cg` lazygit · `cs` SSH |
| `<Espacio>l`   | **LSP** — `lr` renombrar · `la` acción · `lf` formatear · `lh` info |
| `<Espacio>a`   | **Laravel** — `aa` artisan · `ar` rutas · `am` relacionados |
| `<Espacio>t`   | **TODOs**                                                   |
| `<Espacio>x`   | **Diagnósticos** (Trouble)                                  |
| `<Espacio>q`   | **Salir** — `qq` ventana · `qb` buffer · `qQ` todo          |

## 🧭 Movimiento básico de Vim (lo esencial)

| Tecla       | Acción                          |
|-------------|---------------------------------|
| `h j k l`   | izquierda / abajo / arriba / derecha |
| `i` / `Esc` | entrar a escribir / salir       |
| `:w` `:q`   | guardar / cerrar                |
| `s`         | salto rápido (flash) a cualquier parte visible |
| `/texto`    | buscar dentro del archivo       |
| `u` / `⌃r`  | deshacer / rehacer              |
