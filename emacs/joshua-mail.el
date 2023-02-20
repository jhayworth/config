(message "Joshua - You're mail code is loading")

;; Core libraries
(add-to-list 'load-path (expand-file-name "/usr/local/share/emacs/site-lisp/mu4e"))     ;; Add mu4e

(require 'mu4e)

;; use mu4e for e-mail in emacs
(setq mail-user-agent 'mu4e-user-agent)

;; these must start with a "/", and must exist
;; (i.e.. /home/user/Maildir/sent must exist)
;; you use e.g. 'mu mkdir' to make the Maildirs if they don't
;; already exist

;; below are the defaults; if they do not exist yet, mu4e offers to
;; create them. they can also functions; see their docstrings.
(setq mu4e-sent-folder   "/sent")
(setq mu4e-drafts-folder "/drafts")
(setq mu4e-trash-folder  "/trash")

;; smtp mail setting; these are the same that `gnus' uses.
(setq
   message-send-mail-function   'smtpmail-send-it
   smtpmail-default-smtp-server "127.0.0.1"
   smtpmail-smtp-server         "127.0.0.1"
   smtpmail-local-domain        "scriptablecamera.com")

;; the maildirs you use frequently; access them with 'j' ('jump')
(setq   mu4e-maildir-shortcuts
    '((:maildir "/archive" :key ?a)
      (:maildir "/inbox"   :key ?i)
      (:maildir "/work"    :key ?w)
      (:maildir "/sent"    :key ?s)))

;; don't keep message buffers around
;; (setq message-kill-buffer-on-exit t)

(provide 'joshua-mail)
