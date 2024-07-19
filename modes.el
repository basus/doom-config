;;; ../src/doom-config/modes.el -*- lexical-binding: t; -*-


;; Markdown configuration
(after! markdown-mode

  ;; Enable header scaling and explicitly update the faces
  (setq markdown-header-scaling t)
  (markdown-update-header-faces t)

  ;;  This overrides Doom color themes that set :inherit to bold
  (set-face-attribute 'markdown-header-face nil :weight 'bold
                      :inherit 'variable-pitch)

  ;; Turn on LSP (via Eglot) for Markdown
  ;; Eglot is already configured to use Marksman as the server
  (add-hook 'markdown-mode-local-vars-hook #'lsp!)
  (add-hook 'markdown-mode-hook 'turn-on-auto-fill)

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

(setq nxml-slash-auto-complete-flag t)
