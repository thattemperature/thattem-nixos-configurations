{ config, ... }:

{

  services.openssh = {
    enable = true;
    settings = {
      KbdInteractiveAuthentication = false;
      PasswordAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = [ config.users.users.thattemperature.name ];
    };
  };

}
