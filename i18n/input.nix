{
  config,
  lib,
  pkgs,
  ...
}:

let

  rime-data-pkgs = with pkgs; [
    rime-thattem-pinyin
  ];

in

{

  config = lib.mkIf config.thattem-nixos.desktop.enable {

    i18n.inputMethod = {
      enable = true;
      type = "ibus";
      ibus.engines = [
        (pkgs.ibus-engines.rime.override {
          rimeDataPkgs = rime-data-pkgs;
        })
      ];
    };
  };

}
