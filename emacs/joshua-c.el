(message "Joshua - You're c-mode code is loading")

;; Adjust the load path
(add-to-list 'load-path (expand-file-name "~/Work/Emacs-libraries/emacs-ccls"))    ;; Emacs portion of ccls support (C/C++ LSP server)
(add-to-list 'load-path (expand-file-name "~/Work/Emacs-libraries/helm-lsp"))      ;; LSP helm integration

;; Library require section
(require 'ccls)
(require 'magit)
(require 'company)
(require 'lsp-mode)
(require 'helm-lsp)

;; Settings
(setq ccls-executable "/usr/local/bin/ccls")

;; Post-load hooks
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1)

(add-hook 'c-mode-common-hook
    (lambda ()
	;; Test message
        (message "Joshua, you're c-mode hook code has run")

        ;; 4 space tabs, insert spaces
        (setq-default c-default-style "linux"
                      indent-tabs-mode nil
                      c-basic-offset 4)

        ;; turn on 'show matching parens'
        (show-paren-mode 1)

        ;; turn on line numbers
        (linum-mode t)
))

;; Keybindings
(define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol)

(message "Joshua, you're c-mode code has been run")

(provide 'joshua-c)
