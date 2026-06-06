{
  config,
  lib,
  pkgs,
  ...
}:

{

  config = lib.mkIf config.thattem.nixos.desktop.enable {

    services.displayManager = {
      defaultSession = "hyprland";
      sddm = {
        enable = true;
        autoNumlock = true;
        wayland.enable = true;
        settings = {
          Theme = {
            CursorTheme = "Future-cursors";
            CursorSize = 32;
          };
        };
      };
    };

    environment.systemPackages = with pkgs; [
      future-cursor-theme
    ];

    programs.hyprland.enable = true;

    environment.sessionVariables.NIXOS_OZONE_WL = "1";

  };

}
