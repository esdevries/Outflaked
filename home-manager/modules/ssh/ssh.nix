{ profile, ... }:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks."*" = {
      forwardAgent = false;
      addKeysToAgent = "no";
      compression = false;

      serverAliveInterval = 0;
      serverAliveCountMax = 3;
      hashKnownHosts = false;

      controlMaster = "no";
      controlPersist = "no";
      controlPath = "~/.ssh/master-%r@%n:%p";

      userKnownHostsFile = "/media/${profile.userName}/noidea/.ssh/known_hosts";
      identityFile = "/media/${profile.userName}/noidea/.ssh/id_ed25519";
      identitiesOnly = true;
    };
  };
}
