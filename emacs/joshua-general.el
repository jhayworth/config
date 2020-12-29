(provide 'joshua-general)

(defun duplicate-line ()
   (interactive)
   (save-mark-and-excursion
     (beginning-of-line)
     (insert (thing-at-point 'line t))))

(defun move-line-down ()
   (interactive)
   (let ((col (current-column)))
     (save-excursion
       (forward-line)
       (transpose-lines 1))
     (forward-line)
     (move-to-column col)))

 (defun move-line-up ()
   (interactive)
   (let ((col (current-column)))
     (save-excursion
       (forward-line)
       (transpose-lines -1))
     (forward-line -1)
     (move-to-column col)))

;; Setting Defaults

(prefer-coding-system 'utf-8)

(setq make-backup-files nil)

;; turn off line truncation by default
;; (set-default 'truncate-lines t)
;; (set-default 'truncate-partial-width-windows nil)

;; General cleanup
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)

;; When Delete Selection mode is enabled, typed text replaces the selection if the selection is active.
(delete-selection-mode t)
