let
  config = {
    packageOverrides = pkgs: rec {
      haskellPackages = pkgs.haskellPackages.override {
        overrides = haskellPackagesNew: haskellPackagesOld: rec {
          optparse-applicative =
            haskellPackagesNew.callPackage ./optparse-applicative-2.nix { };

          project1 =
            haskellPackagesNew.callPackage ./project1.nix { };

          turtle =
            haskellPackagesNew.callPackage ./turtle-2.nix { };
        };
      };
    };
  };

  pkgs = import <nixpkgs> { inherit config; };

in
  { project1 = pkgs.haskellPackages.project1;
  }
