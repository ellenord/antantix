{ pkgs }: builtins.trace
(builtins.attrNames pkgs.mkShell)
pkgs.mkShell {
  buildInputs = with pkgs; [
    vim
    git
    gcc
    gdb
    zsh
    tmux
    htop
    neovim
    python3
    zsh
    zsh-powerlevel10k
    zsh-system-clipboard
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
    hyprland
  ];
  shellHook = ''
    echo "Добро пожаловать в devShell!"
  '';
}
