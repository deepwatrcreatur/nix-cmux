# nix-cmux

> **Deprecated:** this repository is archived. Use
> [deepwatrcreatur/nix-cmux-tui](https://github.com/deepwatrcreatur/nix-cmux-tui),
> which has the same package, overlay and Home Manager module. Change the flake
> input URL to `github:deepwatrcreatur/nix-cmux-tui`.

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
