{ config, pkgs, ... }:

{
  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket"; # Enables A2DP, HFP etc
      };
    };
  };

  # Install Fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # System
    ntfs3g
    kdePackages.isoimagewriter

    # Basic Applications
    kdePackages.kalk
    gedit
    
    # Utils
    htop
    fastfetch
    curl
    wget
    git

    # Programming / Development
    uv
    gcc
    nasm
    rustup
    nodejs_22
    deno
    go
    kotlin
    jdk
    php
    # godot_4  # <- Godot modifies many things, aka can break the system
    
    # Terminal
    neovim
    zsh
    zsh-powerlevel10k
    alacritty

    # Productivity
    obsidian
    vscode

    # Audio/Bluetooth stuff
    bluez
    blueman
    pulseaudio
  ];
}
