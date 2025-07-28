{ pkgs }:
  pkgs.mkShell {
    buildInputs = [
      pkgs.vim
      pkgs.git
      pkgs.gcc
      pkgs.gdb
      pkgs.zsh
      pkgs.tmux
      pkgs.htop
      pkgs.neovim
      pkgs.python3
      pkgs.zsh-completions
      pkgs.zsh-autosuggestions
      pkgs.zsh-syntax-highlighting
    ];
    shellHook = ''
      export SHELL=$(which zsh)
      if [ -n "$ZSH_VERSION" ]; then
        source ${pkgs.zsh-completions}/share/zsh-completions/zsh-completions.zsh
        source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
        source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        echo "Zsh с автодополнением и подсветкой активирован!"
      fi
      echo "Добро пожаловать в devShell!"
    '';
  }
