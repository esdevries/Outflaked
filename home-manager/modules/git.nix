{ profile, ... }:
{
  programs.git = {
    enable = true;
    userName = profile.fullName;
    userEmail = profile.gitEmail;
    lfs.enable = true;

    aliases = {
      a = "add .";
      c = "commit";
      ca = "commit --amend --no-edit";
      d = "diff";
      f = "fetch";
      lg = "log --oneline --graph --decorate --all";
      nuke = "reset --hard";
      pf = "push --force-with-lease";
      p = "pull";
      rev = "revert HEAD";
      undo = "reset --soft HEAD~1";
      r = "restore";
      rs = "restore --staged";
      s = "switch";
      sa = "stash";
      sc = "switch -c";
      sp = "stash pop";
      st = "status";
      su = "remote set-url origin";
    };

    ignores = [
      "*devenv/"
      "*direnv/"
      ".envrc"
    ];
  };
}
