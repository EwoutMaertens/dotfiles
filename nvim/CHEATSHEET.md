# Neovim Cheatsheet

Leader key is `Space`. Press `Space` by itself to see the which-key popup.

## Basics

| Key | Action |
|-----|--------|
| `Space` | Show all keybindings (which-key) |
| `Space ?` | Search keybindings |
| `:w` | Save |
| `:q` | Quit |
| `:wq` | Save and quit |
| `u` | Undo |
| `Ctrl-r` | Redo |

## File Navigation

| Key | Action |
|-----|--------|
| `Space ff` | Find files (project root) |
| `Space fF` | Find files (cwd) |
| `Space fr` | Recent files |
| `Space fb` | Open buffers |
| `Space e` | File explorer (neo-tree) |

## Search

| Key | Action |
|-----|--------|
| `Space /` | Grep in project (live search) |
| `Space sg` | Grep in project root |
| `Space sG` | Grep in cwd |
| `Space sd` | Grep in specific directory (prompts for path) |
| `Space sb` | Search in buffer lines |
| `Space sB` | Grep across open buffers |
| `Space sw` | Search current word across files (Spectre) |
| `Space sr` | Search and replace across files (Spectre) |
| `Space sf` | Search and replace in current file (Spectre) |
| `Space sc` | Command history |
| `Space sk` | Search keymaps |

## Harpoon (file bookmarks)

| Key | Action |
|-----|--------|
| `Space a` | Bookmark current file |
| `Space h` | Open bookmark menu |
| `Space 1-4` | Jump to bookmark 1-4 |

## Code Navigation

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `gI` | Go to implementation |
| `K` | Hover documentation |
| `]f` / `[f` | Next / prev function |
| `]c` / `[c` | Next / prev class |
| `]a` / `[a` | Next / prev argument |
| `]d` / `[d` | Next / prev diagnostic |

## Text Objects (use with v, d, c, y)

| Key | Action |
|-----|--------|
| `af` / `if` | Outer / inner function |
| `ac` / `ic` | Outer / inner class |
| `aa` / `ia` | Outer / inner argument |

Examples: `vaf` select a function, `dif` delete function body, `cia` change an argument.

## Code Actions

| Key | Action |
|-----|--------|
| `Space ca` | Code actions |
| `Space cr` | Rename symbol |
| `Space cf` | Format file |
| `Space cm` | Mason (manage LSP servers, formatters) |

## Swap Arguments

| Key | Action |
|-----|--------|
| `Space sn` | Swap argument with next |
| `Space sp` | Swap argument with previous |

## Git

| Key | Action |
|-----|--------|
| `Space gs` | Git status (Telescope) |
| `Space gd` | Git diff (hunks) |
| `:Git` | Fugitive git command |
| `:Git blame` | Line-by-line blame |
| `:Git log` | Git log |
| `:Gvdiffsplit` | Side-by-side diff |
| `]h` / `[h` | Next / prev git hunk |

## Debugging (DAP)

| Key | Action |
|-----|--------|
| `Space db` | Toggle breakpoint |
| `Space dB` | Conditional breakpoint |
| `Space dc` | Start / continue |
| `Space di` | Step into |
| `Space do` | Step out |
| `Space dO` | Step over |
| `Space dt` | Terminate |
| `Space du` | Toggle DAP UI |
| `Space de` | Eval expression |

## Diagnostics & Trouble

| Key | Action |
|-----|--------|
| `Space xx` | Diagnostics (Trouble) |
| `Space xX` | Buffer diagnostics |
| `Space xQ` | Quickfix list |
| `Space xt` | TODOs |

## Buffers & Windows

| Key | Action |
|-----|--------|
| `Space ,` | Switch buffer |
| `Space bp` | Pin buffer |
| `Space bP` | Delete non-pinned buffers |
| `Ctrl-h/j/k/l` | Navigate between windows/splits |
| `Space -` | Split horizontal |
| `Space \|` | Split vertical |

## Sessions

| Key | Action |
|-----|--------|
| `Space qs` | Restore session |
| `Space ql` | Restore last session |
| `Space qd` | Don't save session |
