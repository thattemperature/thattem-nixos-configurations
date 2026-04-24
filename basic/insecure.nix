{ lib, ... }:

{

  nixpkgs.config.allowInsecurePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "ventoy"
    ];

}
