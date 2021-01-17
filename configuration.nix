{ configs, pkgs, ... }:

{
  imports = [
    ./modules/information-gathering.nix
    ./modules/general.nix
    ./modules/vpn.nix
  ];

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

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # so that gtk works properly
    extraPackages = with pkgs; [
      swaylock
      swayidle
      wl-clipboard
      mako # notification daemon
      alacritty # Alacritty is the default terminal in the config
      dmenu # Dmenu is the default in the config but i recommend wofi since its wayland native
    ];
  };
}
