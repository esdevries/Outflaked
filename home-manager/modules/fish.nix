{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -U fish_greeting
      alias di='devenv init'

      function pcu
        ssh -p 5768 root@192.168.1.36
      end
    '';
    plugins = [
      {
        name = "grc";
        src = pkgs.fishPlugins.grc;
      }
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish;
      }
      {
        name = "fzf-forgit";
        src = pkgs.fishPlugins.forgit;
      }
      {
        name = "done";
        src = pkgs.fishPlugins.done;
      }
      {
        name = "hydro";
        src = pkgs.fishPlugins.hydro;
      }
      {
        name = "fzf";
        src = pkgs.fzf;
      }
    ];
  };
}
