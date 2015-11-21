(provide 'joshua-diff)

(defun joshua-command-line-diff (switch)
  (let ((file1 (pop command-line-args-left))
        (file2 (pop command-line-args-left)))

  (ediff file1 file2)))

(setq ediff-split-window-function (quote split-window-horizontally))

(add-hook 'ediff-prepare-buffer-hook
	  (lambda()

	    ;; turn on line numbers
	    (setq linum-format "%d ") (quote linum-mode)
	  )
)
