{
  description = "Flake com meu binário";

  inputs = {};

  outputs = { self, ... }:
    let
      pkgs = import <nixpkgs> {};
    in
    {
      packages.x86_64-linux = {
        # Pacote chamado 'teste'
        teste = pkgs.stdenv.mkDerivation {
          pname = "teste";
          version = "1.0";

          # Apenas copia o binário do repo
          src = ./.;

          installPhase = ''
            mkdir -p $out/bin
            cp bin/idk $out/bin/
            chmod +x $out/bin/idk
          '';
        };
      };
    };
}
