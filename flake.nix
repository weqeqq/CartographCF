{
  description = "Description";

  inputs = {
    nixpkgs = {
      url = "git+ssh://git@github.com/nixos/nixpkgs?ref=nixos-unstable";
    };
  };

  outputs = { nixpkgs, ... }: let 
    cartographcf = nixpkgs.pkgs.stdenv.mkDerivation {
      pname   = "CartographCF";
      version = "1.0";

      installPhase = ''
        install -Dm444 ./source/* -t $out/share/fonts/
      '';
    };
  in {
    packages.cartographcf = cartographcf;
  };
}
