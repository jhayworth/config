(provide 'joshua-org)

;; Other libraries
(require 'org-journal)
(require 'org-roam)
(require 'deft)

;; Settings
(add-to-list 'auto-mode-alist '("\\.notes\\'" . org-mode))

;; Agenda
(setq org-agenda-files (list "~/Datastore/org/work.org"
			     "~/Datastore/org/work_archive.org"
			     "~/Datastore/org/home.org"))

(setq org-default-notes-file "~/Datastore/org/notes.org")

;; Journal
(setq org-journal-dir "~/Datastore/org-journal-personal/")

(setq org-journal-template-endofdaytasks "~/emacs/org-endofday-checklist.org")

;; TODO
(setq org-todo-keyword-faces '(
			       ("TODO" . org-warning)
			       ("NEXT" . (:foreground "yellow" :weight bold))
			       ("WAITING" . (:foreground "yellow" :weight bold))
			       ("DONE" . (:foreground "green" :weight bold))
			      ))
(setq org-todo-keywords '((sequence "TODO(t)" "|" "NEXT(n)" "|" "WAITING(w)" "|" "DONE(d)")))
(setq org-log-done 'time)
(setq org-log-into-drawer t)

;; Capture
(setq org-capture-templates
 '(("t" "Todo" entry (file+headline "~/Datastore/org/refile.org" "Tasks") "* TODO %?\n  %i\n  %a")
   ("j" "Journal" entry (file+headline "~/Datastore/org/journal.org" "Today's Journal") "* \nEntered on %U\n  %i\n  %a\n%?")
   ("l" "Link" entry (file+headline "~/Datastore/org/refile.org" "Collected Links") "* URL: %?")
   ))

;; Structure Templates
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("sh" . "src bash"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))

;; Org babel langugaes
;; https://stackoverflow.com/questions/29163164/how-can-i-load-bash-as-opposed-to-sh-in-org-babel-to-enable-begin-src-bash
(org-babel-do-load-languages 'org-babel-load-languages
    '(
        (shell . t)
    )
)

;; Refile
(setq org-refile-targets
      '(("work.org" :maxlevel . 1)
        ("work_archive.org" :maxlevel . 1)))

;; Roam
(setq org-roam-directory "~/Datastore/org/org-roam")
(setq org-roam-index-file "~/Datastore/org/org-roam/20201120145954-index.org")
(add-hook 'after-init-hook 'org-roam-mode)

;; Deft
(setq deft-recursive t)
(setq deft-use-filter-string-for-filename t)
(setq deft-default-extension "org")
(setq deft-directory "~/Datastore/org")

;; Custom key definitions
(global-unset-key (kbd "C-o"))
(global-set-key (kbd "C-o c") 'org-capture)
(global-set-key (kbd "C-o a") 'org-agenda)

;; Org-roam keys
(global-set-key (kbd "C-o r l") 'org-roam)
(global-set-key (kbd "C-o r f") 'org-roam-find-file)
(global-set-key (kbd "C-o r i") 'org-roam-insert)
(global-set-key (kbd "C-o r g") 'org-roam-graph-show)

;; Deft keys
(global-set-key (kbd "C-o d") 'deft)

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

;; Journal template functions
(defun joshua-org-journal-endofday-checklist ()
  "Insert the end of day task list"
  (interactive)
  (insert-file-contents org-journal-template-endofdaytasks)
)

;; ***************************************************
;; Misc functions that exist for creature comforts
;; ***************************************************

;; I got this one from here: https://emacs.stackexchange.com/questions/5387/show-org-mode-hyperlink-as-plain-text
(defun org-toggle-link-display ()
  "Toggle the literal or descriptive display of links."
  (interactive)
  (if org-descriptive-links
      (progn (org-remove-from-invisibility-spec '(org-link))
         (org-restart-font-lock)
         (setq org-descriptive-links nil))
    (progn (add-to-invisibility-spec '(org-link))
       (org-restart-font-lock)
       (setq org-descriptive-links t))))

