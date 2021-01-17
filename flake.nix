{
  description = "A penetration testing linux distribution based on NixOS";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-20.09";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = inputs @ { self, nixpkgs, nixpkgs-unstable, ... }: {
    nixosConfigurations.pwnix = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix {
          imports = [
            "${nixpkgs}/nixos/modules/installer/cd-dvd/iso-image.nix"
          ];
        }
        nixpkgs.nixosModules.notDetected
      ];
    };

    iso = self.nixosConfigurations.pwnix.config.system.build.isoImage;
    vm = self.nixosConfigurations.pwnix.config.system.build.vm;
  };

}
