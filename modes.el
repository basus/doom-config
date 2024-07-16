;;; ../src/doom-config/modes.el -*- lexical-binding: t; -*-


;; Markdown configuration
;; Mainly enables use of marksman as the LSP server via eglot

(defun config-eglot-markdown ()
  (add-hook 'markdown-mode-local-vars-hook #'lsp!)
  (add-hook 'markdown-mode-hook 'turn-on-auto-fill))

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
  (config-eglot-markdown)
  (config-eglot-typescript))
