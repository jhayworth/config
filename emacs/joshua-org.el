(provide 'joshua-org)

(add-to-list 'auto-mode-alist '("\\.notes\\'" . org-mode))

(setq org-agenda-files (list "~/org/work.org"
			     "~/org/home.org"))

(setq org-todo-keyword-faces '(
			       ("TODO" . org-warning)
			       ("ACTIVE" . (:foreground "yellow" :weight bold))
			       ("DONE" . (:foreground "green" :weight bold))
			      ))
(setq org-todo-keywords '((sequence "TODO(t)" "|" "ACTIVE(a)" "|" "DONE(d)")))
(setq org-log-done 'time)

(eval-after-load "org"
  '(progn
     (message "joshua-org load hook executed")

     (defun joshua-org-mode-hook ()
       (visual-line-mode t)
       (flyspell-mode 1)
     )

     (add-hook 'org-mode-hook 'joshua-org-mode-hook)
  ))
