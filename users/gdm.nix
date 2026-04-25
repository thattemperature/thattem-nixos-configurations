{
  config,
  lib,
  pkgs,
  ...
}:

{

  config = lib.mkIf config.thattem.nixos.desktop.enable {

    # Workaround: set as system-wide package
    environment.systemPackages = with pkgs; [
      future-cursor-theme
    ];

    programs.dconf.profiles.gdm.databases = [
      {
        settings = {
          "org/gnome/desktop/peripherals/keyboard" = {
            numlock-state = true;
            remember-numlock-state = true;
          };
          "org/gnome/desktop/interface" = {
            cursor-size = lib.gvariant.mkInt32 32;
            cursor-theme = "Future-cursors";
            document-font-name = "Sarasa UI SC 16";
            font-name = "Sarasa UI SC 16";
            monospace-font-name = "Sarasa Mono SC 16";
          };
        };
      }
    ];
  };

}
