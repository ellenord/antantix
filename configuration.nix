{ config, pkgs, ... }:
{
  imports = [ ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "hostname";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Moscow";

  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  users.users.youruser = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    password = "changeme";
  };

  environment.systemPackages = [ pkgs.vim pkgs.git pkgs.gcc pkgs.gdb pkgs.zsh pkgs.tmux pkgs.htop pkgs.neovim pkgs.python3 ];
  programs.zsh.enable = true;
  users.users.youruser.shell = pkgs.zsh;
  system.stateVersion = "24.05";
}
