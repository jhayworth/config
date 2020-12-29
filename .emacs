(setq user-full-name "Joshua Hayworth")
(setq user-mail-address "joshua@hayworthfamily.com")

;; Additions to load path
(add-to-list 'load-path (expand-file-name "~/emacs"))

(let ((default-directory  "/usr/share/emacs/site-lisp/elpa-src"))
  (normal-top-level-add-subdirs-to-load-path))

;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins/yasnippet"))
;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins/emacs_chrome"))
;;(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu/mu4e")

;; Initialization code
(require 'joshua-init)

;; General UI Startup
(require 'joshua-ui)

;; Personal Utility functions
(require 'joshua-general)

;; Org mode specific configuration
(require 'joshua-org)

;; E-mail configuration
;; (require 'joshua-mail)

;; C Language specific configuration
(require 'joshua-c)

;; Java Language specific configuration
(require 'joshua-js)

;; Emacs shell specific configuration
(require 'joshua-eshell)

;; Python specific configuration
(require 'joshua-python)

;; Other packages
(require 'ido)
(ido-mode t)

(require 'ispell)

;; Yasnippet
(require 'yasnippet)

(yas-global-mode 1)

(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"))                 ;; personal snippets

;; Edit Server
;;(require 'edit-server)
;;(edit-server-start)

;; Magit
(require 'magit)

;; Shell mode
(setq ansi-color-names-vector ; better contrast colors
      ["black" "red4" "green4" "yellow4"
       "blue3" "magenta4" "cyan4" "white"])

;;(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;;(add-hook 'shell-mode-hook
;;     '(lambda () (toggle-truncate-lines 1)))
;;(setq comint-prompt-read-only t)

;; Setup aspell
(setq ispell-program-name "aspell")
(setq ispell-personal-dictionary "~/.personaldictionary")
(setq ispell-list-command "--list")

;; Custom Keybindings
(global-set-key [C-mouse-4] 'text-scale-increase)
(global-set-key [C-mouse-5] 'text-scale-decrease)
(global-set-key "\C-x\C-b" 'buffer-menu)
(global-set-key (kbd "S-C-<right>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; Coding keybindings
(global-set-key [f2] 'speedbar)
(global-set-key [f3] 'highlight-symbol-at-point)
(global-set-key [(control f3)] 'highlight-symbol-query-replace)
(global-set-key [f5] 'compile)
(global-set-key [f12] 'call-last-kbd-macro)
(global-set-key (kbd "C-S-d") 'duplicate-line)
(global-set-key (kbd "C-S-j") 'move-line-down)
(global-set-key (kbd "C-S-k") 'move-line-up)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

;;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(package-selected-packages
;;   (quote
;;    (golden-ratio rebecca-theme org-roam org-journal dockerfile-mode elpy yasnippet minimap magit hydra highlight-symbol ggtags ess company))))
;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(default ((t (:inherit nil :stipple nil :background "#202020" :foreground "#cccccc" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "outline" :family "Fira Mono"))))
;; '(which-func ((t (:foreground "light gray")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yasnippet minimap magit hydra highlight-symbol ggtags ess company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
