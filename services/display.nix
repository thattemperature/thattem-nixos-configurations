{
  config,
  lib,
  pkgs,
  ...
}:

{

  config = lib.mkIf config.thattem.nixos.desktop.enable (
    lib.mkMerge [

      {
        services.displayManager.gdm.enable = true;

        users.users = lib.genAttrs' [ null 1 2 3 4 ] (
          i:
          let
            suffix = lib.optionalString (i != null) "-${toString (i + 1)}";
          in
          lib.nameValuePair "gdm-greeter${suffix}" {
            packages = with pkgs; [
              future-cursor-theme
            ];
          }
        );

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
      }

      { services.desktopManager.gnome.enable = true; }
    ]
  );

}
