# 🛠️ Neovim como workspace tipo terminal (estilo Terax)

Configuración de Neovim pensada como **terminal/workspace**: árbol de archivos al
lado, Claude integrado, terminales para SSH y un esquema de atajos al estilo Terax.
Funciona en **Mac y PC** (Windows/Linux).

> Pensado para usarse con **Neovide** (la GUI de Neovim), porque es la única forma
> de tener atajos con la tecla ⌘ en Mac. Ábrelo escribiendo `neovide` en tu terminal.

> 💡 **Chuleta rápida**: dentro de Neovim pulsa `⌘/` (Mac) / `Alt+/` (PC) o escribe
> `:Atajos` para ver todos los atajos en una ventana flotante. También en
> [`SHORTCUTS.md`](SHORTCUTS.md).

---

## ⌨️ Atajos estilo Terax (modificador)

El modificador cambia solo según el sistema operativo:

| | Mac | Windows / Linux |
|---|---|---|
| **Modificador** | **⌘ (Cmd)** | **Alt** |

> ¿Por qué Alt en PC? Porque `Ctrl` está reservado por Vim y la tecla `Win` se la
> queda el sistema. (En Mac los ⌘ solo funcionan dentro de **Neovide**.)

| Acción | Mac | PC | |
|---|---|---|---|
| Abrir archivo (quick open) | `⌘P` | `Alt+p` | Telescope |
| Buscar texto en el proyecto | `⌘⇧F` | `Alt+Shift+F` | live grep |
| Buscar en el archivo actual | `⌘F` | `Alt+f` | |
| Explorador de archivos | `⌘B` | `Alt+b` | abrir/cerrar |
| Foco en el explorador | `⌘⇧E` | `Alt+Shift+E` | |
| **Claude (IA)** | `⌘I` | `Alt+i` | flotante |
| Terminal flotante | `⌘R` | `Alt+r` | |
| Git (lazygit) | `⌘G` | `Alt+g` | |
| Pestaña nueva | `⌘T` | `Alt+t` | |
| Archivo nuevo | `⌘E` | `Alt+e` | |
| Cerrar panel/pestaña | `⌘W` | `Alt+w` | |
| Cambiar de pestaña | `⌃Tab` / `⌃⇧Tab` | igual | |
| Ir a pestaña 1–9 | `⌘1`–`⌘9` | `Alt+1`–`Alt+9` | |
| Dividir panel → derecha | `⌘D` | `Alt+d` | |
| Dividir panel ↓ abajo | `⌘⇧D` | `Alt+Shift+D` | |
| Foco panel siguiente/anterior | `⌘]` / `⌘[` | `Alt+]` / `Alt+[` | |
| Zoom +/−/reset | `⌘=` `⌘-` `⌘0` | `Alt+=` `Alt+-` `Alt+0` | |
| Copiar / Cortar / Pegar | `⌘C` `⌘X` `⌘V` | `Alt+c` `Alt+x` `Alt+v` | |
| Seleccionar todo | `⌘A` | `Alt+a` | |
| Guardar | `⌘S` | `Alt+s` | |
| Deshacer / Rehacer | `⌘Z` / `⌘⇧Z` | `Alt+z` / `Alt+Shift+Z` | |
| Ver este menú de atajos | `⌘K` | `Alt+k` | which-key |

---

## 🚀 Atajos universales `<leader>` (la barra espaciadora)

Funcionan **igual en Mac y PC**, y también dentro de una terminal (no solo Neovide).
Pulsa `Espacio` y espera: aparece el menú de ayuda (**which-key**).

| Prefijo | Grupo |
|---|---|
| `<Espacio>f` | **Buscar** (archivos, texto, buffers, recientes…) |
| `<Espacio>g` | **Git** (status, commits, ramas) |
| `<Espacio>e` | **Explorador** de archivos |
| `<Espacio>c` | **Claude / Terminal** (`cc` Claude, `cf` terminal, `cg` lazygit, `cs` SSH) |
| `<Espacio>l` | **LSP** (renombrar, acción de código, formatear…) |
| `<Espacio>a` | **Laravel** (artisan, rutas, relacionados) |
| `<Espacio>t` | **TODOs** |
| `<Espacio>x` | **Diagnósticos** (Trouble) |
| `<Espacio>q` | **Salir / cerrar buffer** |

---

## 🤖 Terminal: Claude, SSH y Git

- **Claude**: `⌘I` / `Alt+i` (o `<Espacio>cc`) — abre/cierra Claude en un panel flotante.
- **SSH**: `:Ssh usuario@servidor` (o `<Espacio>cs`) — abre la sesión en una pestaña.
- **Lazygit**: `⌘G` / `Alt+g` (o `<Espacio>cg`).
- **Terminal suelta**: `⌘R` / `Alt+r` (o `<Espacio>cf`).
- Dentro de una terminal, pulsa **`Esc` `Esc`** (dos veces) para volver a Neovim.

---

## 💻 Usarlo en otra computadora (Mac ↔ PC)

1. Clona este repo en la carpeta de config de Neovim:
   - **Mac/Linux**: `~/.config/nvim`
   - **Windows**: `~/AppData/Local/nvim`
2. Abre Neovim/Neovide una vez: lazy.nvim instala todo solo.
3. **Instala una Nerd Font** para ver los iconos (en Mac ya tienes *Hack Nerd Font*).
4. Opcional: `brew install lazygit` (Mac) para el atajo de Git.

> En Windows, `telescope-fzf-native` necesita `cmake`. Si no lo tienes, no pasa nada:
> el buscador sigue funcionando (solo un poco más lento). Lo demás funciona igual.

---

## 📦 Plugins principales

Explorador `neo-tree` · Buscador `telescope` · Terminales `toggleterm` · Tema
`catppuccin` · Barra `lualine` · Atajos `which-key` · LSP `mason` + `lspconfig` ·
Autocompletado `nvim-cmp` · Sintaxis `treesitter` · Diagnósticos `trouble` ·
Mensajes `noice` + `notify` · Dashboard `alpha`.
