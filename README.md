NOTE!!

Many of the config files in this repository are originally from Derek Taylor's Gitlab
Also known as DistroTube

These are the links to his work

[Derek Taylor on gitlab](https://gitlab.com/dwt1/)

[DistroTube channel on youtube](https://www.youtube.com/channel/UCVls1GmFKf6WlTraIb_IaJg)

For the xmonad installation guide, It's from Brian Buccola

This is the original [article](https://brianbuccola.com/how-to-install-xmonad-and-xmobar-via-stack/)


I spent so much time looking for answers and trying to make things work in xmonad, so this is a guide to help you get the same outcome I got but whitout getting frustrated!!

Even thought I've done this on ```Arch``` some of the steps will stay the same on other ```Linux Distributions```

Enjoy the last result!!

Preview image
<br>
<img src="ss.png" width="800">
<br>

<br>
<img src="ss2.png" width="800">
<br>

<br>
<img src="ss3.png" width="800">
<br>

# My **Arch Linux Xmonad** setup

## Setup my environment

Install all my needed and favourite apps
<details>
    <summary>Terminals</summary>

    1.alacritty
    2.kitty
</details>
<details>
    <summary>File explorer</summary>

    1.ranger
        Deps: w3m, uberzug
    2.pcmanfm
</details>
<details>
    <summary>Text editor</summary>

    1.neovim
    2.vim
    3.gedit
</details>
<details>
    <summary>IDE</summary>

    1.visual-studio-code
    2.visual-studio-code-insiders
</details>
<details>
    <summary>Shells</summary>

    1.bash
    2.fish
    3.zsh
</details>
<details>
    <summary>Browsers</summary>

    1.firefox
    2.brave
    3.surf
    4.qutebrowser
</details>
<details>
    <summary>Video Editors</summary>

    1.kdenlive
    2.openshot
    3.davinci resolve
</details>

* Screenshot utility: scrot
* ScreenLock utility: i3lock-fancy
(or just ```i3lock``` with an image, it loads faster that way and you make it look the same as ```i3lock-fancy``` just check the [official repo](https://github.com/meskarune/i3lock-fancy) for more details on that)
* Music player: mocp (terminal based)
* AudioVisualizer: cli-visualizer (terminal based)

<details>
    <summary>System ressources monitor</summary>

    1.htop
    2.gotop
</details>
<details>
    <summary>Fonts</summary>

    1.ttf-ubuntu-font-family
    2.otf-fontawesome-5-free
    3.ttf-open-sauce-sans
    4.ttf-mononoki
    5.adobe-source-code-pro-fonts
    6.nerd-fonts-mononoki
    7.ttf-arabeyes-fonts
    8.ttf-amiri
</details>
<details>
    <summary>Video player</summary>

    1.mpv
    2.vlc
</details>

* PDF reader: evince
* ClipBoard Manager: copyq
<details>
    <summary>Office suite</summary>

    1.WPS Office
    2.LibreOffice
</details>
<details>
    <summary>Tools</summary>

    1.tmux
    2.arch-wiki-docs
    3.x-on-resize
    4.blueman
    5.xdg-user-dirs
    6.xdotool
    7.git
    8.paru
    9.yay
    10.python-pip
    11.python2-pip
    12.xclip
    13.xsel
    14.devour
    15.shell-color-scripts
    16.conky
    17.doas
    18.lsd
    19.bat
    20.jp2a
    21.figlet
    22.lolcat
    23.neofetch
    24.cowsay
    25.tldr
    26.tty-clock
    27.pipes-rs
    28.cmake
    29.ninja
    30.clang
    31.pkgconf
    32.base-devel
    33.jq
    34.zsh-syntax-highlighting
    35.zsh-autosuggestions-git
</details>
<details>
    <summary>LaTeX</summary>

    1.texlive-most
    2.texlive-lang
    3.biber
</details>
<details>
    <summary>Xmonad</summary>

    1.trayer
    2.volumeicon
    3.pavucontrol
    4.pulseaudio
    5.lxappearance
    6.nitrogen
    7.compton
    8.dmenu
    9.rofi
</details>
<details>
    <summary>Apps</summary>

    1.telegram-desktop
    2.discord
    3.lightcord
    4.blender
    5.inkscape
    6.gimp
    7.krita
    8.github-desktop
    9.code
    10.code-insiders
    11.eclipse
    12.atom
    13.godot
</details>
<details>
    <summary>Programming Languages</summary>

    1.dart/flutter
    2.rust
</details>

<br>
To install the above packages follow the steps below
<br>

You might face some errors even if you're following the exact steps here.
If you do check the [ERRORS](./ERRORS.md) guide where I have solution to some common erros.


Clone this repo to your home direcotory using this command (IMPORTANT because all the commands in the steps will only work if you clone it in $HOME)

>```
>git clone https://github.com/black-purple/arch-xmonad-setup
>```

# Packages & Tools
To install the packages in the official repos use the following command:

>```
>sudo pacman -Syyu --needed dunst jq openshot copyq kitty arch-wiki-docs arch-wiki-lite pavucontrol pulseaudio lxappearance blueman tmux xsel xclip python-pip python2-pip ttf-ubuntu-font-family scrot curl wget base-devel cmake ninja pkgconf clang alacritty ranger w3m ueberzug neovim fish firefox chromium qutebrowser doas vlc mpv texlive-most texlive-lang biber xdg-user-dirs git xdotool lsd bat figlet lolcat neofetch cowsay tldr telegram-desktop discord libreoffice blender inkscape gimp krita atom godot evince rust
>```


To install packages from the aur use the following command:

NOTE!!

If you don't have an aur helper I suggest you use one.


I personally use yay so this is the command I'm using.

>```
>yay eclipse-java-bin i3lock-fancy-git gotop jp2a wps-office shell-color-scripts visual-studio-code-bin tty-clock visual-studio-code-insiders-bin pipes-rs github-desktop otf-fontawesome-5-free ttf-open-sauce-sans ttf-mononoki adobe-source-code-pro-fonts ttf-arabeyes-fonts ttf-amiri nerd-fonts-mononoki devour shell-color-scripts zsh-syntax-highlighting zsh-autosuggestions-git
>```

If you want to install yay use this chain of commands:

>```
>cd /tmp; git clone https://aur.archlinux.org/yay-git.git; cd yay-git; makepkg -si
>```
<br>

## User Dirs

Change the dir names for my user dirs (Desktop, Downloads, Pictures...) to shorter lowercase names (dt, dls, pcs...) for quick access in the terminal.

>```
>nvim ~/.config/user-dirs.dirs
>```

## Xmonad

You can install **Xmonad**, **Xmonad-contrib** and **Xmobar** from the official repos by using this commad

>```
>sudo pacman -Sy --needed xmonad xmonad-contrib xmobar
>```

But if you want to build **Xmonad** with some specific flags, follow the steps here from Brian Buccula's [blog](https://brianbuccola.com/how-to-install-xmonad-and-xmobar-via-stack/).

<br>
<hr>

## Shell prompt
Install [starship prompt](https://starship.rs/) using their script

>```
>sh -c "$(curl -fsSL https://starship.rs/install.sh)"
>```

Add the appropriate line to your shell's config file

* bash
>```
># ~/.bashrc
>
>eval "$(starship init bash)"
>```

* fish
>```
># ~/.config/fish/config.fish
>
>starship init fish | source
>```

* zsh
>```
># ~/.zshrc
>
>eval "$(starship init zsh)"
>```

### Vim Plug

Run the following commad for Vim

>```
>curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
>    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
>```

Run the following command for Neovim

>```
>sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
>       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
>```

These commads are taken from the [official repo](https://github.com/junegunn/vim-plug) of vim plug



### Config Files

Clone the repo to your home directory
>```
>cd; git clone https://github.com/black-purple/arch-xmoand-setup
>```
Copy the config files each to it's appropriate location

* xmonad
>```
>rm ~/.xmonad/xmonad.hs
>cp ~/dotfiles/configs/xmonad.hs ~/.xmonad/xmonad.hs
>cp -r ~/dotfiles/xpm/ ~/.xmonad
>```

* xmobar
>```
>rm ~/.config/xmobar/xmobarrc
>cp ~/dotfiles/configs/xmobarrc ~/.config/xmobar/xmobarrc
>```

* rofi
>```
>rm -rf ~/.config/rofi
>cp -r ~/dotfiles/configs/rofi/ ~/.config/
>```

* neovim
>```
>rm ~/.config/nvim/init.vim
>cp ~/dotfiles/configs/init.vim ~/.config/nvim/init.vim
>```

After copying the config files run this command ```:PlugInstall```

If you face an issue with neovim plugins check the solution in [ERRORS.md](./ERRORS.md)


* vim
>```
>rm ~/.vimrc
>cp ~/dotfiles/configs/vimrc ~/.vimrc
>```

* alacritty
>```
>rm ~/.config/alacritty/alacritty.yml
>cp ~/dotfiles/configs/alacritty.yml ~/.config/alacritty/alacritty.yml
>```

* fish
>```
>rm -rf ~/.config/fish
>cp -r ~/dotfiles/configs/fish/ ~/.config/
>```

* ranger
>```
>rm -rf ~/.config/ranger
>cp -r ~/dotfiles/configs/ranger/ ~/.config/
>```

* conky
>```
>rm -rf ~/.config/conky/
>cp -r ~/dotfiles/configs/conky ~/.config/
>```


* tmux

You have to install Tmux Plugin Manager ([TPM](https://github.com/tmux-plugins/tpm)) in order for this config to work for you.

>```
>cp ~/dotfiles/configs/tmux.config ~/.tmux.config
>```

After copying this config file go inside of tmux and use this keyboard shortcut to install the basic tmux theme.

>```
>Ctrl a + I (capital)
>```


You can find other themes on github [here](https://github.com/tmux-plugins).

## Conky Setup

I took the theming from [devianart](https://www.deviantart.com)
<br>
The creater is Khiky Merveilles
<br>
This is the [post](https://www.deviantart.com/khiky-merveilles/art/Enif-Conky-theme-880596072) on [devianart](https://www.deviantart.com)
<br>
Follow the inscructions there and copy the config files here to have the look in the screenshots

## Flutter Install

 Install flutter by cloning the official repo from github
>```
>git clone https://github.com/flutter/flutter.git
>```

Then add the flutter directory to you PATH

Run this command to see if flutter is working fine
(it might take some time to download some files)

>```
>flutter doctor
>```

You will have some erros concerning **Android Studio** and **Android SDK**

**Android Studio** will install all the needed packages for android developpement including **Android SDK**.

So to install **Android Studio** you have three options.

* #### From the AUR

Here I used paru, but you can use whatever AUR helper you feel confortable with
>```
>paru -S android-studio
>```

* #### Using SNAP package manager

Run this command to make sure that snap is installed. If it's not istalled it will install it for you.

>```
>sudo pacman -Sy --needed snapd
>```

To install **Android Studio** using snap, use this command

>```
>snap install android-studio --classic
>```

* #### Install from official website

Download the archive from [the official website](https://developer.android.com/studio/).

Go to ```~/Downloads``` and extract the archive.

**cd** into **~/Downloads/android-studio/**

Then open the file **Install-Linux-tar.txt** and follow the instructions there to install **Android Studio**


Rerun this command to insure that everything is okay

>```
>flutter doctor -v
>```

If you face an error when trying to accept the ```android licenses``` consider checking [ERRORS.md](./ERRORS.md)

IMPORTANT!!

When done with all the errors you might want to run this command to download some needed packages for Flutter developpement (optional)

>```
>flutter precache
>```


If you want to enable desktop support in Flutter use this command

>```
>flutter config --enable-linux-desktop
>```

Run flutter doctor again to see if you need any other packages to make apps for Linux / Windows / Mac.

On ```Linux``` you'll need ```ninja, cmake, clang, pkg-config```

You can install them with this command

>```
>sudo pacman -S --needed ninja clang cmake pkgconf
>```

<br>

# Some Blender Addons

![image](https://user-images.githubusercontent.com/82895430/131049482-896c476b-2b76-46fe-88bb-f2e402d77bfc.png)


# Special Thanks

* Derek Taylor
* Brian Buccola
* Khiky Merveilles
* Edoardo Vignati
