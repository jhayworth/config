;; (setq custom-theme-directory "~/emacs/themes")

;; No splash screen please or content in my scratch pad
(setq initial-scratch-message "")
(setq inhibit-startup-message t)

(menu-bar-mode -1)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(global-set-key [mouse-4] 'scroll-down-line)
(global-set-key [mouse-5] 'scroll-up-line)
(xterm-mouse-mode 1)

;;(load-theme 'ayu-grey t)

(blink-cursor-mode 0)
(setq-default cursor-type 'bar)
(set-cursor-color "#cccccc")
(setq ring-bell-function 'ignore)

;; Set smooth scrolling
(setq scroll-step 1
      scroll-conservatively 10000)

(provide 'joshua-ui)
