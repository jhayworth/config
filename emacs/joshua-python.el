(provide 'joshua-python)

;;(message "Joshua - You're python code is loading")
;;(elpy-enable)
;;(message "Joshua - You're python code has loaded")

(add-hook 'python-mode-hook
    (lambda ()

        (message "Joshua - You're python mode hook has executed")

        ;; 4 space tabs, insert spaces
        (setq-default c-default-style "linux"
                      indent-tabs-mode nil
                      c-basic-offset 4)

        ;; turn on 'show matching parens'
        (show-paren-mode 1)

        ;; turn on line numbers
        (linum-mode t)
))
