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
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
    ntfs3g
    kdePackages.isoimagewriter

    kdePackages.kalk
    sublime4

    curl
    git
    neovim
    zsh
    zsh-powerlevel10k
    alacritty

    vscode

    # Audio/Bluetooth stuff
    bluez
    blueman
    pulseaudio
  ];

  # Why?
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];
}
