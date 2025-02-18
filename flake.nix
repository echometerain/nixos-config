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
    # phps.url = "github:fossar/nix-phps";
    nix-matlab = {
      # nix-matlab's Nixpkgs input follows Nixpkgs' nixos-unstable branch. However
      # your Nixpkgs revision might not follow the same branch. You'd want to
      # match your Nixpkgs and nix-matlab to ensure fontconfig related
      # compatibility.
      inputs.nixpkgs.follows = "nixpkgs";
      url = "gitlab:doronbehar/nix-matlab";
    };
    musnix.url = "github:musnix/musnix";
    clipboard-sync.url = "github:dnut/clipboard-sync";
  };

  outputs = {
    nixpkgs,
    # phps,
    ...
  } @ inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix
        inputs.home-manager.nixosModules.default
        # inputs.musnix.nixosModules.musnix
	inputs.clipboard-sync.nixosModules.default
      ];
    };
    # # Sikee shell
    # devShell.${system} = pkgs.mkShell {
    #   buildInputs = [
    #     phps.packages.${system}.php74
    #   ];
    # };
  };
}
