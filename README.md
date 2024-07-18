# Doom Emacs Configuration

This is my personal configuration for [Doom
Emacs](https://github.com/doomemacs/doomemacs "Doom Emacs").
It's currently composed of the following files:

  - `init.el`: [Doom
    modules](https://github.com/doomemacs/doomemacs/blob/master/docs/modules.org
    "Doom modules") that I'm currently using.
  - `config.el` : Fonts, theme, some global configuration, and loading the other
    files.
  - `keybindings.el` : Custom keybindings. Loaded by `config.el`.
  - `modes.el` : Custom configurations for particular modes. Loaded by `config.el`.
  - `packages.el`: Install and configure packages that don't have a Doom module.


## Key Features

This configuration mainly does the following:

  - Set fonts: Fira Code, Fira Sans and Go Mono as the default, variable pitch
    and serif fonts respectively.
  - Use Zenburn as the color theme.
  - Use Eglot as the Language Server Protocol client, and configure it for
    languages as necessary.
  - Add mnemonic keybindings from Spacemacs, especially if Doom does not already
    have one set for the given function.
