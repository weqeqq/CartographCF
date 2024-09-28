{
  description = "Description";

  inputs = {
    nixpkgs = {
      url = "git+ssh://git@github.com/nixos/nixpkgs?ref=nixos-unstable";
    };
  };

  outputs = { nixpkgs, ... }: let 
    pkgs = import nixpkgs { system = "x86_64-linux"; };
    cartographcf = pkgs.stdenv.mkDerivation {
      pname   = "CartographCF";
      version = "1.0";

      src = ./source;

      installPhase = ''
        install -Dm444 truetype/* -t $out/share/fonts/truetype
      '';
    };
  in {
    packages.cartographcf = cartographcf;
  };
}
