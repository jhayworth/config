(message "Joshua - You're machine specific code is loading")

(when (string= system-name "whiskey-guardian")
      (let ((default-directory  "/usr/share/emacs/site-lisp/elpa"))
	(normal-top-level-add-to-load-path '("."))
	(normal-top-level-add-subdirs-to-load-path))
)

(provide 'joshua-machinespecific)
