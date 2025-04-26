{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Install firefox.
  programs.firefox.enable = true;

  # Install Partition Manager
  programs.partition-manager.enable = true;

  # Z Shell (Oh My ZSH) Setup
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableBashCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable =  true;

    shellAliases = {
      # ===== Nix ======
      # Misc
      nx-dir  = "cd /etc/nixos";
      nx-edit = "sudoedit /etc/nixos/configuration.nix";

      # System Management
      nx-sm-nextgen  = "sudo nixos-rebuild switch";
      nx-sm-rollback = "sudo nixos-rebuild switch --rollback";
      nx-sm-upgrade  = "sudo nixos-rebuild switch --upgrade";
      nx-sm-flake    = "sudo nixos-rebuild switch --flake";
      nx-sm-upflake  = "sudo nixos-rebuild switch --upgrade --flake";
      nx-sm-test     = "sudo nixos-rebuild test";
      nx-sm-boot     = "sudo nixos-rebuild boot";

      # Flakes
      nx-flake = "nix flake";
      nx-f-upd = "nix flake update";
      nx-f-shw = "nix flake show";
      nx-f-bld = "nix build .#";
      nx-f-shl = "nix shell .#";
      nx-f-dev = "nix develop .#";

      # Development
      nx-dev   = "nix develop";
      nx-d-shl = "nix-shell";
      nx-d-shp = "nix-shell --pure -p";

      # Garbage Collection
      nx-gc-generations = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
      nx-gc-env-clean   = "sudo nix-env --delete-generations";
      nx-gc-clean       = "sudo nix-collect-garbage";
      nx-gc-ll-clean    = "sudo nix-store --gc";
      nx-gc-clean-old   = "sudo nix-collect-garbage -d";
      nx-gc-clean-all   = "nx-gc-ll-clean; nx-gc-clean-old";
      
      # ===== Git =====
      gt            = "git";
      gt-push-o     = "git push -u origin";
      gt-push-m     = "git push -u origin main";
      gt-reset-last = "git reset HEAD~1";

      # ===== Misc =====
      nv = "nvim";
    };

    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        "z"
        "npm"
        "history"
        "node"
        "rust"
        "deno"
      ];
    };

    promptInit = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme

      ZSH_THEME="powerlevel10k/powerlevel10k"

      export EDITOR=nvim
    '';
  };

  # Virtualisation (VirtualBox)
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;
  users.extraGroups.vboxusers.members = [ "neo" ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
