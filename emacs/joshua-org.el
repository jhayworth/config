(message "Joshua - You're org code is loading")

;; Adjust the load path
(add-to-list 'load-path (expand-file-name "~/Work/Emacs-libraries/websocket"))    ;; Websocket library (https://github.com/ahyatt/emacs-websocket)
(add-to-list 'load-path (expand-file-name "~/Work/Emacs-libraries/simple-httpd")) ;; Simple web server
(add-to-list 'load-path (expand-file-name "~/Work/Emacs-libraries/org/lisp"))     ;; Add org-core
(add-to-list 'load-path (expand-file-name "~/Work/Emacs-libraries/org-journal"))  ;; Add org-journal
(add-to-list 'load-path (expand-file-name "~/Work/Emacs-libraries/emacsql"))      ;; Add emacsql (A dependency of org-roam among other things)
(add-to-list 'load-path (expand-file-name "~/Work/Emacs-libraries/org-roam"))     ;; Add org-roam
(add-to-list 'load-path (expand-file-name "~/Work/Emacs-libraries/org-roam-ui"))  ;; Add org-roam-ui (https://github.com/org-roam/org-roam-ui)
(add-to-list 'load-path (expand-file-name "~/Work/Emacs-libraries/deft"))         ;; Add deft

(message "Joshua - Org load path modifications complete")

;; Pre-load settings
(setq org-roam-v2-ack t)

;; library require section
(require 'org)
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
(setq org-roam-dailies-directory "daily/")
(setq org-roam-dailies-capture-templates
      '(("d" "default" entry
         "* %?"
         :target (file+head "%<%Y-%m-%d>.org"
                            "#+title: %<%Y-%m-%d>\n"))))

(org-roam-db-autosync-mode)


;; Roam UI
(load-library "org-roam-ui")

;; Deft
(setq deft-directory "~/Datastore/org")
(setq deft-recursive t)
(setq deft-use-filter-string-for-filename t)
(setq deft-strip-summary-regexp ":PROPERTIES:\n\\(.+\n\\)+:END:\n")
(setq deft-default-extension "org")
(setq deft-use-filename-as-title t)

;; Custom key definitions
(global-unset-key (kbd "C-o"))
(global-set-key (kbd "C-o c") 'org-capture)
(global-set-key (kbd "C-o a") 'org-agenda)
(global-set-key (kbd "C-o l") 'org-toggle-link-display)

;; Org-roam keys
(global-set-key (kbd "C-o r f") 'org-roam-node-find)
(global-set-key (kbd "C-o r i") 'org-roam-node-insert)
(global-set-key (kbd "C-o r c") 'org-roam-capture)
(global-set-key (kbd "C-o r t") 'org-roam-buffer-toggle)

;; Org-roam UI keys
(global-set-key (kbd "C-o r u") 'org-roam-ui-mode)

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

(provide 'joshua-org)
