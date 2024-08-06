;;; ../src/doom-config/keybindings.el -*- lexical-binding: t; -*-

;; These are keybindings that do not neatly fall under any mode.
;; Most of these replicate Spacemacs keybindings
(map! :leader
      :desc "Clear search highlights"
      "s c" #'evil-ex-nohighlight)

;; This makes fill-paragraph somewhat usable in web-mode, sometimes.
(map! :map web-mode-map
      (:localleader
       :desc "Fill paragraph" "f"
       (lambda () (interactive) (mark-paragraph) (fill-paragraph) )))
