(provide 'joshua-org)

(add-to-list 'auto-mode-alist '("\\.notes\\'" . org-mode))

(eval-after-load "org"
  '(progn
     (message "test from joshua-org")

     (defun joshua-org-mode-hook ()
       ;; The following two lines of code is run from the mode hook.
       ;; These are for buffer-specific things.
       ;; In this setup, you want to enable flyspell-mode
       ;; and run org-reveal for every org buffer.
       (flyspell-mode 1)
       (org-reveal)
       )

     (add-hook 'org-mode-hook 'joshua-org-mode-hook)
  ))
