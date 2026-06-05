<div align="center">

# 🖥️ nvim-config

### Neovim como un *workspace de terminal* — no solo un editor

Árbol de archivos al lado · **Claude (IA)** integrado · SSH · atajos estilo **Terax**
La misma configuración en **macOS y Windows/Linux**.

![Neovim](https://img.shields.io/badge/Neovim-0.11%2B-57A143?style=flat-square&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/Lua-2C2D72?style=flat-square&logo=lua&logoColor=white)
![Plataformas](https://img.shields.io/badge/macOS%20·%20Windows%20·%20Linux-808080?style=flat-square)
![Neovide](https://img.shields.io/badge/Neovide-ready-FFCC00?style=flat-square)

</div>

---

## ✨ ¿Por qué?

La mayoría de configuraciones convierten Neovim en un IDE. Esta hace lo contrario:
lo convierte en un **workspace de terminal** cómodo y bonito — pensado para *vivir en
la terminal* (correr Claude, conectarte por SSH, navegar proyectos) sin renunciar a
editar código cuando hace falta.

Hecha para quien **quiere usar Neovim para todo pero siempre termina volviendo al
IDE**: trae sesiones que recuerdan tu proyecto, autoguardado, atajos modernos con
`⌘`/`Alt` y un menú de ayuda para no memorizar nada.

> 💡 Inspirada en la distribución del terminal **Terax** (pestañas, paneles, panel de
> IA y árbol de archivos), pero con la potencia de Neovim debajo.

## 🎯 Qué trae

**🧰 Workspace**
- 📂 Árbol de archivos lateral (`neo-tree`)
- 🤖 **Claude** como panel lateral fijo (`⌘I`)
- 🔌 **SSH** en una pestaña — `:Ssh usuario@servidor`
- 🌿 Git visual con **lazygit** (`⌘G`) y cambios en el margen (`gitsigns`)
- 🖥️ Terminales flotantes integradas (`toggleterm`)

**🪄 Comodidades de IDE moderno (para que no lo abandones)**
- 💾 **Sesiones**: reabres y vuelve tu proyecto, archivos y paneles
- ⌨️ Atajos estilo Terax: **`⌘` en Mac · `Alt` en PC** (automático según el SO)
- 🗂️ Pestañas visuales de los archivos abiertos (`bufferline`)
- ✅ Autoguardado · formato al guardar · auto-pares · `gcc` para comentar
- 🔍 Buscador difuso (`telescope`), LSP, autocompletado y `treesitter`

**❓ Ayuda siempre a mano**
- Pulsa **`⌘/`** (o `:Atajos`) para ver la chuleta completa — sin memorizar nada.

## ⚙️ Requisitos

|                | |
|----------------|-------------------------------------------------------|
| **Neovim**     | ≥ 0.11                                                |
| **Neovide**    | recomendado — *necesario para los atajos con `⌘`*     |
| **Nerd Font**  | para los iconos (ej. [Hack Nerd Font](https://www.nerdfonts.com)) |
| *Opcionales*   | `ripgrep` (búsqueda), `lazygit` (git), `node` (LSP), `claude` (IA) |

## 🚀 Instalación

```bash
# macOS / Linux
git clone https://github.com/rasalopa/nvim-config ~/.config/nvim

# Windows (PowerShell)
git clone https://github.com/rasalopa/nvim-config $env:LOCALAPPDATA\nvim
```

Abre **Neovide** (o `nvim`) y espera: [`lazy.nvim`](https://github.com/folke/lazy.nvim)
instala todo solo la primera vez.

```bash
neovide
```

## ⌨️ Atajos

El modificador se elige solo según tu sistema:

|                  | macOS      | Windows / Linux |
|------------------|------------|-----------------|
| **Modificador**  | `⌘` (Cmd)  | `Alt`           |

| Atajo            | Acción                          |
|------------------|---------------------------------|
| `⌘P` / `Alt+p`   | Abrir archivo (quick open)      |
| `⌘⇧F`            | Buscar texto en el proyecto     |
| `⌘B`             | Árbol de archivos               |
| `⌘I`             | **Claude (IA)**                 |
| `⌘G`             | Git (lazygit)                   |
| `⌘D` / `⌘⇧D`     | Dividir panel (derecha / abajo) |
| `⌘/`             | **Ver TODOS los atajos**        |

👉 Lista completa en **[SHORTCUTS.md](SHORTCUTS.md)** o con `:Atajos` dentro de Neovim.

> Los atajos con `<Espacio>` (barra espaciadora) funcionan en **todas partes**,
> incluso en una terminal pura (no solo en Neovide).

## 🧩 Plugins principales

Explorador `neo-tree` · Buscador `telescope` · Terminales `toggleterm` · Tema
`catppuccin` · Barra `lualine` · Pestañas `bufferline` · Atajos `which-key` ·
LSP `mason` + `lspconfig` · Autocompletado `nvim-cmp` · Sintaxis `treesitter` ·
Diagnósticos `trouble` · Git `gitsigns` · Sesiones `persistence` · Auto-pares
`autopairs` · Rodear `mini.surround`.

## 📁 Estructura

```
~/.config/nvim
├── init.lua             # arranque + lazy.nvim
├── lua/
│   ├── vim-options.lua  # opciones base de Neovim
│   ├── terax-keys.lua   # atajos ⌘/Alt estilo Terax
│   ├── terax-util.lua   # utilidades de los atajos
│   ├── autocmds.lua     # autoguardado, formato al guardar, etc.
│   ├── cheatsheet.lua   # la chuleta flotante (:Atajos)
│   └── plugins/         # un archivo por plugin
├── SHORTCUTS.md         # chuleta de atajos
└── README.md
```

## 🙏 Créditos

Construida sobre el trabajo de la comunidad de Neovim:
[lazy.nvim](https://github.com/folke/lazy.nvim) ·
[folke](https://github.com/folke) ·
[catppuccin](https://github.com/catppuccin/nvim) ·
[telescope](https://github.com/nvim-telescope/telescope.nvim) ·
[neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) y muchos más.
Inspiración de la distribución: **Terax**.

## 📄 Licencia

Configuración personal — úsala, clónala y adáptala libremente.

<div align="center">

— Hecho con 💙 para vivir en la terminal —

</div>
