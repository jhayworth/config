(defvar emacs-root (if (or (eq system-type 'cygwin)
						   (eq system-type 'linux))
						   "/home/joshua.hayworth"
						   "c:/home/joshua.hayworth")
"Home directory -- the root of personal emacs load-path")

;; Startup
(setq initial-scratch-message "")
(setq inhibit-startup-message t)

;; Load Miscelaneous Libraries
(setq load-path (cons (expand-file-name "~/emacs/misc") load-path))

;; Custom Functions
(defun jmh-toggle-selective-display ()
	(interactive)
	(set-selective-display (if selective-display nil 1)))

;; ido mode
(require 'ido)
(ido-mode t)

;; Shell mode
(setq ansi-color-names-vector ; better contrast colors
      ["black" "red4" "green4" "yellow4"
       "blue3" "magenta4" "cyan4" "white"])

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'shell-mode-hook 
     '(lambda () (toggle-truncate-lines 1)))
(setq comint-prompt-read-only t)

;; Turn on tabs
(setq indent-tabs-mode t)
(setq-default indent-tabs-mode t)

;; Bind the TAB key 
(global-set-key (kbd "TAB") 'self-insert-command)

;; Set the tab width
(setq default-tab-width 4)
(setq tab-width 4)
(setq c-basic-indent 4)
(setq c-default-style "bsd"
	c-basic-offset 4)

;; Custom Keybindings
(global-set-key "\C-c\C-e" 'eval-expression)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(global-set-key [f12] 'call-last-kbd-macro)

(delete-selection-mode t)

;; Turn off the crap (scrollbar, toolbar, menu bar)
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Always run a shell
(shell)
