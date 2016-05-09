(provide 'joshua-c)

(add-hook 'c-mode-common-hook
    (lambda ()
        ;; 4 space tabs, insert spaces
        (setq-default c-default-style "linux"
                      indent-tabs-mode nil
                      c-basic-offset 4)

	;;(when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
	;;  (ggtags-mode 1))

        ;; turn on 'show matching parens'
        (show-paren-mode 1)

        ;; turn on line numbers
        (linum-mode t)

        ;; turn on irony mode
        ;;(irony-mode t)

        ;; Show the current function
        (which-function-mode t)

        (custom-set-variables
         ;; custom-set-variables was added by Custom.
         ;; If you edit it by hand, you could mess it up, so be careful.
         ;; Your init file should contain only one such instance.
         ;; If there is more than one, they won't work right.
        )
        (custom-set-faces
         ;; custom-set-faces was added by Custom.
         ;; If you edit it by hand, you could mess it up, so be careful.
         ;; Your init file should contain only one such instance.
         ;; If there is more than one, they won't work right.
         '(which-func ((t (:foreground "light gray")))))
))
