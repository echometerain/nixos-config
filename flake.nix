{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    hyprland-qtutils.url = "github:hyprwm/hyprland-qtutils";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
      # to have it up-to-date or simply don't specify the nixpkgs input
      inputs.nixpkgs.follows = "nixpkgs";
    };
    newpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # musnix.url = "github:musnix/musnix";
    clipboard-sync.url = "github:dnut/clipboard-sync";
  };

  outputs = {
    nixpkgs,
    ...
  } @ inputs:
  let
    hosts = [ "moving-castle" "cloud-castle" ];
  in {
    nixosConfigurations = nixpkgs.lib.genAttrs hosts (host: nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/${host}/hardware-configuration.nix
        ./configuration.nix
        inputs.clipboard-sync.nixosModules.default
      ];
    });
  };
}
