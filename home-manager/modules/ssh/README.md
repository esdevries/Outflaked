## For creating new usb

Just use gnome disks for formatting

```bash
cp -r ~/.ssh /path/to/usb/usb/
chmod 700 /path/to/usb/.ssh
chmod 600 /path/to/usb/.ssh/id_ed25519
chmod 644 /path/to/usb/.ssh/id_ed25519.pub
chmod 644 /path/to/usb/.ssh/known_hosts
```
