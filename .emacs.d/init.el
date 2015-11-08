;; init.el --- Joshua's attempt at multi-platform emacs configuration
(setq user-full-name "Joshua Hayworth")
(setq user-mail-address "joshua@hayworthfamily.com")

;; No splash screen please or content in my scratch pad
(setq initial-scratch-message "")
(setq inhibit-startup-message t)

;; Remove backups
(setq make-backup-files nil)

;; Turn off the toolbar, menu bar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Source load path
(add-to-list 'load-path (expand-file-name "~/emacs"))

;; Theme load path
(add-to-list 'custom-theme-load-path "~/.emacs.d/color-themes")
(load-theme 'noctilux t)

;; Fun startup message
(defun display-startup-echo-area-message ()
  (message "Let the hacking begin!"))

;; Marmalade package management
;;(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

;; ido mode
(require 'ido)
(ido-mode t)

(require 'whitespace)
(require 'highlight-symbol)
(require 'minimap)
(require 'joshua-c)

;; magit mode
;;(require 'magit)
;;(require 'magit-svn)

;; Shell mode
(setq ansi-color-names-vector ; better contrast colors
      ["black" "red4" "green4" "yellow4"
       "blue3" "magenta4" "cyan4" "white"])

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'shell-mode-hook
     '(lambda () (toggle-truncate-lines 1)))
(setq comint-prompt-read-only t)

;; Auto-Complete mode
;;(require 'auto-complete-config)
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")

; start auto-completion after 2 characters of a word
;;(setq ac-auto-start 2)

; case sensitivity is important when finding matches
;;(setq ac-ignore-case nil)
;;(ac-config-default)

; turn off line truncation by default
(set-default 'truncate-lines t)
(set-default 'truncate-partial-width-windows nil)

;; ***************** HOOKS *****************
;; JavaScript specific settings
(add-hook 'js-mode-hook
	  (lambda ()
	    ;; Scan the file for nested code blocks
	    (imenu-add-menubar-index)

	    ;; turn on 'show matching parens'
	    (show-paren-mode 1)

	    ;; turn on line numbers
	    (linum-mode t)

	    ;; Activate the folding mode
	    (hs-minor-mode t)))

;; General cleanup
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Set smooth scrolling
(setq scroll-step 1
      scroll-conservatively 10000)

;; Autocreation of new lines at the end of a buffer
(setq next-line-add-newlines t)

;; Custom Keybindings
(global-set-key "\C-c\C-e" 'eval-expression)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key (kbd "S-C-<right>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(global-set-key [f5] 'compile)
(global-set-key [f3] 'highlight-symbol-at-point)
(global-set-key [(control f3)] 'highlight-symbol-query-replace)
(global-set-key [f12] 'call-last-kbd-macro)

(delete-selection-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#202020" :foreground "#cccccc" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "outline" :family "Consolas")))))
