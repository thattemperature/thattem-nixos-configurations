((nil
  . ((eglot-workspace-configuration
      . (:nixd
         (:nixpkgs
          (:expr "import (builtins.getFlake (builtins.toString ./.)).inputs.nixpkgs { overlays = [ (builtins.getFlake (builtins.toString ./.)).inputs.thattem-nixpkgs-overlays.overlays.default ]; }")

          :formatting
          (:command [ "nixfmt" ])

          :options
          (:nixos
           (:expr "((builtins.getFlake (builtins.toString ./.)).inputs.nixpkgs.lib.nixosSystem { system = \"x86_64-linux\"; modules = [ ]; }).options")

           :thattemperature
           (:expr "((builtins.getFlake (builtins.toString ./.)).inputs.nixpkgs.lib.evalModules { modules = [ (builtins.getFlake (builtins.toString ./.)).inputs.thattem-nixos-options.nixosModules.default ]; }).options"))))))))
