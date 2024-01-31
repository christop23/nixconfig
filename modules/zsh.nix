
{ pkgs, ... }:

let

  # My shell aliases
  myAliases = {
    ls = "eza --icons";
    cat = "bat --theme=Dracula";
    la = "ls -a";
    sv = "python -m http.server 3000";
    nixupdate = "cd ~/.dotfiles && sudo nixos-rebuild switch --flake .#";
  };

  in

  {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    initExtra = "ZSH_AUTOSUGGEST_STRATEGY=(history completion)";
    syntaxHighlighting.enable = true;
    shellAliases = myAliases;

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "sudo" "python" ];
    };
    
    loginExtra = "exec sway";
  };

  home.packages = with pkgs; [
    bat
    eza
  ];

}
