{ configs, pkgs, ... }:

{
  # Main user
  users.users.pentester = {
    initialPassword = "H@x0r";
    isNormalUser = true;
    extraGroups = [
      "wheel" # sudo
   ];
  };

  # GUI
  services.xserver = {
    enable = true;
    desktopManager.plasma5.enable = true;
    displayManager.sddm.enable = true;
  };

}
