# VPN stuff

{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    openvpn
  ];
}
