{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nix-darwin,
      nixpkgs,
    }:
    let
      configuration =
        { pkgs, ... }:
        {
          # List packages installed in system profile. To search by name, run:
          # $ nix-env -qaP | grep wget
          environment.systemPackages = with pkgs; [
            vim
            pam-reattach
            direnv
            nixd
            nil
            nixfmt-rfc-style
            colima
            docker
            tmux
          ];

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          programs = {
            direnv = {
              enable = true;
              nix-direnv.enable = true;
            };
            fish.enable = true;
          };

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 5;

          # The platform the configuration will be used on.
          nixpkgs.hostPlatform = "aarch64-darwin";
          security.pam.enableSudoTouchIdAuth = true;
          environment.etc."pam.d/sudo_local".text = ''
            # Managed by nix-darwin
            auth       optional       ${pkgs.pam-reattach}/lib/pam/pam_reattach.so ignore_ssh
            auth       sufficient     pam_tid.so
          '';

          users.users.tolikmalibroda = {
            name = "tolikmalibroda";
            home = "/Users/tolikmalibroda";
          };

        };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#Toliks-MacBook-Air
      darwinConfigurations."Toliks-MacBook-Air" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
        ];
      };
    };
}
