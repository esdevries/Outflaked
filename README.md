<div align="center">

# Outflaked Home-Manager Configuration

### This repository contains my home-manager configuration.

</div>

---

## Usage

### Getting Outflaked

Install any distro and later install the [nix](https://nixos.org/download/)
package manager, then clone the repo.

```bash
git clone https://github.com/esdevries/Outflaked.git && cd Outflaked
git switch home-manager-only
```

### Optional disabling of stupid snapd error when building home-manager

```bash
systemctl --user mask snap.prompting-client.daemon.service
```

### Fix apparmor in Ubuntu killing chrome-sandbox

```bash
sudo cp home-manager/conf/nix-vscode /etc/apparmor.d/nix-vscode
sudo systemctl reload apparmor
```

### Editing nix package manager config

```bash
echo -e "\nexperimental-features = nix-command flakes\ntrusted-users = root YOUR_USERNAME" | sudo tee -a /etc/nix/nix.conf
```

### Edit personal details

Next, make sure to update the `flake.nix` file with your own personal details.

```nix
# Example of what might be in flake.nix
profile = {
  userName = "YOUR_USERNAME";
  fullName = "YOUR_FULL_NAME";
  gitEmail = "YOUR_GIT_EMAIL";
};
```

### One time path update

```bash
# Just in case nix isn't in your path yet
export PATH="$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:$PATH"
```

### Install

```bash
# Assuming you have the nix package manager
nix-shell -p home-manager
./build.sh
```

### Change shell to fish

```bash
sudo sh -c 'echo /home/YOUR_USERNAME/.nix-profile/bin/fish >> /etc/shells'
chsh -s $(which fish)
```
