# dotfiles

My personal dot files

## Installation

```bash
mkdir ~/src && cd $_
git clone https://github.com/JasonSFuller/dotfiles
~/src/dotfiles/install.sh
```

## Other notes

* **PuTTY** - You may need to set **Connection > Data > Terminal-type string =
  "linux"** in some cases to get the <kbd>home</kbd> and <kbd>end</kbd> keys to
  work properly, _e.g._ when connecting to `sshd` under WSL v1 (Ubuntu 18.04
  LTS).

  If the remote server is newer, _e.g._ Ubuntu 20.04, you can use "putty"
  instead, assuming the remote system has the corresponding `terminfo` files.

  To check for PuTTY `terminfo` files, you can typically find them here:

  ```bash
  ls /usr/share/terminfo/p/putty*
  ```
