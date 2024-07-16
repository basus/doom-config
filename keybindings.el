;;; ../src/doom-config/keybindings.el -*- lexical-binding: t; -*-

;; Most of these replicate Spacemacs keybindings
(map! :leader
      :desc "Clear search highlights"
      "s c" #'evil-ex-nohighlight)
