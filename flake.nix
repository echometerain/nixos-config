{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    hyprland-qtutils.url = "github:hyprwm/hyprland-qtutils";
    # newpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # musnix.url = "github:musnix/musnix";
    clipboard-sync.url = "github:dnut/clipboard-sync";
  };

  outputs = {
    nixpkgs,
    ...
  } @ inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix
        inputs.home-manager.nixosModules.default
	inputs.clipboard-sync.nixosModules.default
      ];
    };
  };
}
