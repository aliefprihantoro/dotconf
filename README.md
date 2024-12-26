# CLI CONFIG
myconfiguration for termux, proot-distro and debian based

> [!WARNING]
> to auto install this. It requires root access (because i not use sudo in this script), except you use termux.
> may have get error. please report in [issue](https://github.com/alifprihantoro/dotconf/issues).
> for manual install/setup [click here](https://github.com/alifprihantoro/new-content/) for how i setup. in folder `setup/termux.md` or `setup/linux/*` and `bookmarks/cli.md`.

## install
### clone repo
> [!WARNING]
> use pacman for termux for not error. see [in here](https://github.com/alifprihantoro/new-content/tree/master/setup/termux.md/#change-package-manager).
```bash
cd
git clone --depth=1 https://github.com/aliefprihantoro/dotconf .myconf
```
### install for termux
```bash
bash .myconf/install/termux/init.sh
```
### install for debian/proot-distro
```bash
bash .myconf/install/debian/init.sh
```