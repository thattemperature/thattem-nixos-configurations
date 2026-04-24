{
  config,
  lib,
  pkgs,
  ...
}:

{

  config = lib.mkIf config.thattem-nixos.display.enable {

    fonts = {
      fontDir.enable = true;
      packages = with pkgs; [
        nerd-fonts.symbols-only
        sarasa-gothic
      ];
      fontconfig.defaultFonts = {
        serif = [
          "Symbols Nerd Font"
          "Sarasa Gothic SC"
        ];
        sansSerif = [
          "Symbols Nerd Font"
          "Sarasa Gothic SC"
        ];
        monospace = [
          "Symbols Nerd Font Mono"
          "Sarasa Mono SC"
        ];
      };
    };
  };

}
