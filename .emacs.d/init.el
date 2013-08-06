;; init.el --- Joshua's attempt at multi-platform emacs configuration

;; Startup
(add-to-list 'load-path "~/.emacs.d/")

;; No splash screen please or content in my scratch pad
(setq initial-scratch-message "")
(setq inhibit-startup-message t)

;; Remove backups
(setq make-backup-files nil)

;; Turn off the crap (scrollbar, toolbar, menu bar)
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Theme load path
(add-to-list 'custom-theme-load-path "~/.emacs.d/color-themes")
(load-theme 'noctilux t)

;; Marmalade package management
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

;; ido mode
(require 'ido)
(ido-mode t)

(require 'whitespace)
(require 'highlight-symbol)

;; magit mode
(require 'magit)
(require 'magit-svn)

;; Shell mode
(setq ansi-color-names-vector ; better contrast colors
      ["black" "red4" "green4" "yellow4"
       "blue3" "magenta4" "cyan4" "white"])

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'shell-mode-hook 
     '(lambda () (toggle-truncate-lines 1)))
(setq comint-prompt-read-only t)

;; Auto-Complete mode
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")

; start auto-completion after 2 characters of a word
(setq ac-auto-start 2)

; case sensitivity is important when finding matches
(setq ac-ignore-case nil)
(ac-config-default)

;; Common language hook
(add-hook 'c-mode-common-hook
	  (lambda ()
	    ;; 4 space tabs, insert spaces
	    (setq-default c-default-style "linux"
			  indent-tabs-mode nil
			  c-basic-offset 4)
	    ;; turn on line numbers
	    (linum-mode t)))

;; JavaScript specific settings
(add-hook 'js-mode-hook
	  (lambda ()
	    ;; Scan the file for nested code blocks
	    (imenu-add-menubar-index)

	    ;; Activate the folding mode
	    (hs-minor-mode t)))

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
(global-set-key [(control f3)] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)
(global-set-key [f12] 'call-last-kbd-macro)

(delete-selection-mode t)
