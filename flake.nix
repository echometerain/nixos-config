{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    hyprland-qtutils.url = "github:hyprwm/hyprland-qtutils";
    zen-browser.url = "github:MarceColl/zen-browser-flake";
    # newpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # musnix.url = "github:musnix/musnix";

    claude-desktop = {
      url = "github:k3d3/claude-desktop-linux-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        # flake-utils.follows = "nixpkgs";
      };
    };
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
