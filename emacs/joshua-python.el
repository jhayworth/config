(provide 'joshua-python)

(message "Joshua - You're python code is loading")
(elpy-enable)

(setq python-shell-interpreter "python3"
      python-shell-interpreter-args "-i")

(when (require 'flycheck nil t)
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode))

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
