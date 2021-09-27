;; Associate files with js-mode
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))

(add-hook 'js-mode-hook
	  (lambda ()
	    ;; Test message
	    (message "Joshua, you're js-mode code has run")

	    ;; 4 space tabs, insert spaces
	    (setq-default c-default-style "linux"
			  indent-tabs-mode nil
			  c-basic-offset 4)

	    ;; turn on line numbers
	    (linum-mode t)
	  )
)

(provide 'joshua-js)
