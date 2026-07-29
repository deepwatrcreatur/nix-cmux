# nix-cmux

Nix package, Home Manager module, and Overlay for `cmux-tui` — the tmux-like terminal multiplexer TUI backed by `libghostty-vt` for AI coding agents (from [manaflow-ai/cmux](https://github.com/manaflow-ai/cmux)).

## Usage

### In a Flake

```nix
inputs.nix-cmux.url = "github:deepwatrcreatur/nix-cmux";
```

### Home Manager Module

```nix
imports = [ inputs.nix-cmux.homeManagerModules.default ];

programs.cmux-tui.enable = true;
```

### Run Directly

```bash
nix run github:deepwatrcreatur/nix-cmux
```
