### AGENTS.md

Welcome to the **davidpeach/dotfiles** repository. This file provides context and instructions for AI agents (like Junie!) working within this project.

### System Context
- **OS**: Arch Linux (BTW).
- **WM**: Sway (Wayland-based).
- **Shell**: Bash.
- **Terminal**: Kitty.
- **Editor**: Neovim (using a modular Lua setup in `nvim/lua/`).
- **Main Theme**: **Gruvbox** (Dark).

### Repository Architecture
- **Symlinking**: The `install` script handles symlinking configurations from this repository to `~/.config/`, `~/.local/bin/`, and `~/`. **Always edit the source files in this repo.**
- **`scripts/`**: A central hub for custom CLI tools and shims. Check this directory before creating new automation — a tool for the job likely already exists there.
- **`packages.txt` & `packages-aur.txt`**: The source of truth for installed software. Update these when suggesting or installing new dependencies.

### Guidelines for Agents
1. **Modularity**: Maintain the existing Neovim configuration pattern (`nvim/lua/config/` and `nvim/lua/plug/`).
2. **Script-First**: Prefer adding a new tool to `scripts/` over a complex bash alias or long-running one-liner.
3. **Theme Consistency**: Respect the **Cyberdream** color variables defined in `sway/config`.
4. **Wayland Ready**: Ensure any graphical/UI-related suggestions are Wayland-compatible (e.g., using `wl-copy`, `waybar`, or `rofi-wayland`).
5. **Junie CLI**: The user uses Junie (shimmed via `scripts/junie`). Be context-aware of this integration.
6. **Package Management**: Use `pacman` (official) and `yay` (AUR) for software management.
