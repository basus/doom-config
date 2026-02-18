;;; ../src/doom-config/keybindings.el -*- lexical-binding: t; -*-

;; Use comma (,) as the localleader key
(setq evil-snipe-override-evil-repeat-keys nil)
(setq doom-localleader-key ",")
(setq doom-localleader-alt-key "M-,")

;; TODO: Not sure how to avoid repetition because map! is a macro, so can't just
;; use `apply' with the arguments in a list.
;; This makes fill-paragraph somewhat usable in web-mode, sometimes.
(map! :map web-mode-map
      (:localleader
       :desc "Fill paragraph" "f"
       (lambda () (interactive) (mark-paragraph) (fill-paragraph) )))

(map!
 :desc "Return and indent"      :imv "RET" #'newline-and-indent
 
 ;; Better movement bindings
 :desc "Go to start of line"    :nmv "H" #'evil-first-non-blank
 :desc "Go to bottom of window" :nmv "J" #'evil-window-bottom
 :desc "Go to top of window"    :nmv "K" #'evil-window-top
 :desc "Go to end of line"      :nmv "L" #'evil-last-non-blank

 ;; More useful bindings
 :desc "Redo"                   :nmv "U"   #'evil-redo
 :desc "Join"                   :nmv "C-j" #'evil-join

 ;; For some reason this doesn't seem to bound by default
 :desc "Yasnippet expand"       :ni  "C-'" #'yas-expand

)

;; Miscellaneous other keybindings
(map! :leader
      :desc "Indent lines in region"  "I"   #'indent-region
      :desc "Clear search highlights" "s c" #'evil-ex-nohighlight
      :desc "Delete other windows"    "w D" #'delete-other-windows

      (:prefix "c" (:when (modulep! :tools lsp +eglot)
        :desc "Get help at point"        "h" #'eldoc
        :desc "Visit the next error"     "n" #'flycheck-next-error
        :desc "Visit the previous error" "p" #'flycheck-previous-error )))
