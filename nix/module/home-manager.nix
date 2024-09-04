{ config, lib, pkgs, ... }: {

    programs.home-manager.enable = true;

    xdg.configFile = import ../util/xdgMap.nix config [
        "hammerspoon"
        "nvim"
        "tmux"
        "wezterm"
        "terminal"
        "yazi"
    ];

    home = {
        packages = with pkgs; [ 
            bottom
            fnm
            git-credential-oauth 
            jq
            tmux
            wezterm
        ];
        
        sessionPath = [
            "/opt/homebrew/bin"
            "${config.xdg.configHome}/terminal/scripts"
        ];
        enableNixpkgsReleaseCheck = false;
        stateVersion = "23.05";
    };

    programs = {
        awscli = { enable = true; };
        bun = { 
            enable = true;
            enableGitIntegration = false;
        };
        eza = { enable = true; };
        fd = { enable = true; };
        fzf = import ./fzf.nix;
        git = import ./git.nix; 
        neovim = {
            enable = true;
            defaultEditor = true;
        };
        ripgrep = { enable = true; };
        tmux = { enable = true; };
        yazi = { enable = true; };
        zsh = import ./zsh config;
    };
}
