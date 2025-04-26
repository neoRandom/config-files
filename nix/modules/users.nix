{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.neo = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Fellipe Leonardo";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
  };
}
