(provide 'joshua-c)

(add-hook 'c-mode-common-hook
    (lambda ()

      ;; 4 space tabs, insert spaces
      (setq-default c-default-style "linux"
                    indent-tabs-mode nil
                    c-basic-offset 4)

      ;; turn on 'show matching parens'
      (show-paren-mode 1)

      ;; turn on line numbers
      (linum-mode t)

      ;; Show the current function
      (which-function-mode t)
))
