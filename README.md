# Stanisz's `dotfiles` Flake

Hi! Thanks for checking out my `NixOS` `home-manager` config :seedling:

## Prerequisites

You need to install [`home-manager`](https://github.com/nix-community/home-manager) first. 
Follow the [official installation guidelines](https://nix-community.github.io/home-manager/). 
Make sure to enable Flakes on your `NixOS` system.

## Usage

Please clone the repository to your home directory:

```bash
git clone git@github.com:Staneesh/dotfiles.git ~/
```

Next, use `home-manager` to switch onto the new configuration:

```{bash}
home-manager switch --flake ~/dotfiles
```
