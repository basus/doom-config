;;; ../src/doom-config/modes.el -*- lexical-binding: t; -*-


;; Markdown configuration
(after! markdown-mode

  ;; Enable header scaling and explicitly update the faces

  ;;  This overrides Doom color themes that set :inherit to bold
  (custom-theme-set-faces! nil
    '(markdown-header-face :weight bold :inherit variable-pitch)
    '(markdown-header-face-1 :inherit markdown-header-face)
    '(markdown-header-face-2 :inherit markdown-header-face)
    '(markdown-header-face-3 :inherit markdown-header-face)
    '(markdown-header-face-4 :inherit markdown-header-face)
    '(markdown-header-face-5 :inherit markdown-header-face))

  (setq markdown-header-scaling t)
  (markdown-update-header-faces t)

  ;; Turn on LSP (via Eglot) for Markdown
  ;; Eglot is already configured to use Marksman as the server
  (add-hook 'markdown-mode-local-vars-hook #'lsp!)

  (add-hook! 'markdown-mode-hook
             #'turn-on-auto-fill
             (yas-activate-extra-mode 'nxml-mode)
             (yas-activate-extra-mode 'basus-v4-mode))

  ;; Bind fill-paragraph to something easier
  (map! :map markdown-mode-map
        :localleader
        "f" #'fill-paragraph ))


;; TypeScript configuration

(defun config-eglot-typescript ()
  (add-to-list 'eglot-server-programs
               '((js-mode typescript-mode) . (eglot-deno "deno" "lsp")))

  (defclass eglot-deno (eglot-lsp-server) ()
    :documentation "A custom class for deno lsp.")

  (cl-defmethod eglot-initialization-options ((server eglot-deno))
    "Passes through required deno initialization options"
    (list :enable t
          :lint t)))

(after! eglot
  (config-eglot-typescript))

;; Web-mode configuration, mainly for use with Vento files. Check the
;; keybindings file as well.
(after! web-mode
  (setq nxml-slash-auto-complete-flag t)
  (add-hook! web-mode #'auto-fill-mode))

(add-to-list 'auto-mode-alist '("\\.vto\\'" . web-mode))

;; Treemacs configuration
(after! treemacs
  (treemacs-project-follow-mode))

;; LaTeX configuration using auctex
(after! auctex

  (setq
   LaTeX-indent-environment-check nil
   LaTeX-indent-level 0
   TeX-PDF-mode   t
   TeX-auto-save  t
   TeX-parse-self t
   TeX-brace-indent-level 0
   TeX-master nil
   TeX-engine 'luatex
   TeX-source-correlate-mode t
   TeX-source-correlate-start-server t
   TeX-source-correlate-method 'synctex)

  (defun latex-custom ()
    (auto-fill-mode)
    (latex-math-mode))

  (add-hook 'LaTeX-mode-hook 'latex-custom))


;; Fennel configuration
(autoload 'fennel-mode "~/Public/fennel/emacs-mode.el" nil t)
(add-to-list 'auto-mode-alist '("\\.fnl\\'" . fennel-mode))
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs '(fennel-mode . ("fennel-ls"))))

;; Rust configuration
(after! rustic
  (setq
   rustic-compile-directory-method 'rustic-buffer-workspace))
