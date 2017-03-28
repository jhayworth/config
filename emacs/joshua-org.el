(provide 'joshua-org)

(add-to-list 'auto-mode-alist '("\\.notes\\'" . org-mode))

(setq org-agenda-files (list "~/org/work.org"
			     "~/org/home.org"))

(eval-after-load "org"
  '(progn
     (message "test from joshua-org")

     (defun joshua-org-mode-hook ()
       (visual-line-mode t)
       (flyspell-mode 1)
     )

     (add-hook 'org-mode-hook 'joshua-org-mode-hook)
  ))
