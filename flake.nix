{
  description = "Nix package, Home Manager module, and overlay for cmux-tui (manaflow-ai/cmux)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in
    {
      packages = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = self.packages.${system}.cmux-tui;
          cmux-tui = pkgs.callPackage ./package.nix { };
          cmux = self.packages.${system}.cmux-tui;
        }
      );

      homeManagerModules.default =
        {
          config,
          lib,
          pkgs,
          ...
        }:
        let
          cfg = config.programs.cmux-tui;
          cmuxPkg = self.packages.${pkgs.stdenv.hostPlatform.system}.cmux-tui;
        in
        {
          options.programs.cmux-tui = {
            enable = lib.mkEnableOption "cmux-tui - terminal multiplexer for AI coding agents";
          };

          config = lib.mkIf cfg.enable {
            home.packages = [ cmuxPkg ];
          };
        };

      overlays.default = final: prev: {
        cmux-tui = self.packages.${prev.system}.cmux-tui;
        cmux = self.packages.${prev.system}.cmux-tui;
      };
    };
}
