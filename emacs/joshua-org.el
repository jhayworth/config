(provide 'joshua-org)

;; Settings
(add-to-list 'auto-mode-alist '("\\.notes\\'" . org-mode))

(setq org-agenda-files (list "~/org/work.org"
			     "~/org/home.org"))
(setq org-default-notes-file "~/org/notes.org")
(setq org-todo-keyword-faces '(
			       ("TODO" . org-warning)
			       ("NEXT" . (:foreground "yellow" :weight bold))
			       ("WAITING" . (:foreground "yellow" :weight bold))
			       ("DONE" . (:foreground "green" :weight bold))
			      ))
(setq org-todo-keywords '((sequence "TODO(t)" "|" "NEXT(n)" "|" "WAITING(w)" "|" "DONE(d)")))
(setq org-log-done 'time)

(setq org-capture-templates
 '(("t" "Todo" entry (file+headline "~/org/refile.org" "Tasks") "* TODO %?\n  %i\n  %a")
   ("j" "Journal" entry (file+headline "~/org/journal.org" "Today's Journal") "* \nEntered on %U\n  %i\n  %a\n%?")
   ("l" "Link" entry (file+headline "~/org/refile.org" "Collected Links") "* URL: %?")
   ))

;; Custom key definitions
(define-key global-map "\C-cc" 'org-capture)

;; Post-load hook
(eval-after-load "org"
  '(progn
     (message "joshua-org post load hook executed")

     (defun joshua-org-mode-hook ()
       (visual-line-mode t)
       (flyspell-mode 1)
     )

     (add-hook 'org-mode-hook 'joshua-org-mode-hook)
  ))
