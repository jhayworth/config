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

(setq mu4e-sent-folder   "/sent")
(setq mu4e-drafts-folder "/drafts")
(setq mu4e-trash-folder  "/trash")

;;send mail using postfix
(setq send-mail-function 'sendmail-send-it)
(setq message-send-mail-function 'message-send-mail-with-sendmail)

;; Turn off address autocompletion feature
(setq mu4e-compose-complete-addresses nil)

;; the maildirs you use frequently; access them with 'j' ('jump')
(setq   mu4e-maildir-shortcuts
	'(
	  (:maildir "/" :key ?r)
	  (:maildir "/archive" :key ?a)
          (:maildir "/inbox"   :key ?i)
          (:maildir "/work"    :key ?w)
          (:maildir "/sent"    :key ?s)))

;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)

;; Prefer text version of messages
(with-eval-after-load "mm-decode"
  (add-to-list 'mm-discouraged-alternatives "text/html")
  (add-to-list 'mm-discouraged-alternatives "text/richtext"))

;; View email in Firefox
(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-generic-program "firefox")

(setq mu4e-contexts
    `( ,(make-mu4e-context
          :name "Private"
          :enter-func (lambda () (mu4e-message "Entering Private context"))
          :leave-func (lambda () (mu4e-message "Leaving Private context"))
          :vars '( ( user-mail-address	    . "joshua@hayworthfamily.com"  )
                   ( user-full-name	    . "Joshua Hayworth" )
                   )
	  )
       
       ,(make-mu4e-context
          :name "Work"
          :enter-func (lambda () (mu4e-message "Entering Work context"))
	  :leave-func (lambda () (mu4e-message "Leaving Work context"))
          :vars '( ( user-mail-address	     . "joshua@scriptablecamera.com" )
                   ( user-full-name	     . "Joshua Hayworth" )
                   ( mu4e-compose-signature  .
                     (concat
                       "Joshua Hayworth\n"
                       "Owner, Software Developer\n"))))
      )
 )

;; compose with the current context is no context matches;
;; default is to ask
(setq mu4e-compose-context-policy nil)

(provide 'joshua-mail)
