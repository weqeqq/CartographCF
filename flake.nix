{
  description = "Description";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
  };

  outputs = { nixpkgs, ... }: let 
    pkgs = import nixpkgs { system = "x86_64-linux"; };
    cartographcf = pkgs.stdenv.mkDerivation {
      pname   = "CartographCF";
      version = "1.0";

      src = ./source;

      installPhase = ''
        install -Dm444 opentype/* -t $out/share/fonts/opentype
      '';
    };
  in {
    packages.cartographcf = cartographcf;
  };
}
