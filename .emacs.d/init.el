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

;;(require 'whitespace)
;;(require 'highlight-symbol)
;;(require 'minimap)

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
;; Common language hook
(add-hook 'c-mode-common-hook
	  (lambda ()
	    ;; 4 space tabs, insert spaces
	    (setq-default c-default-style "linux"
			  indent-tabs-mode nil
			  c-basic-offset 4)

	    ;; turn on 'show matching parens'
	    (show-paren-mode 1)

	    ;; turn on line numbers
	    (linum-mode t)

            ;; show the current function
            (which-function-mode t)))

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
;;(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Set smooth scrolling
(setq scroll-step 1
      scroll-conservatively 10000)

;; Autocreation of new lines at the end of a buffer
;;(setq next-line-add-newlines t)

;; ***************** EDITING FUNCTIONS *****************

;; http://www.emacswiki.org/emacs/DeletingWhitespace
(defun joshua-delete-leading-whitespace (start end)
  "Delete whitespace at the beginning of each line in region."
  (interactive "*r")
  (save-excursion
    (if (not (bolp)) (forward-line 1))
    (delete-whitespace-rectangle (point) end nil)))

;; http://www.emacswiki.org/BackwardKillLine
(defun joshua-backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))

;; Custom Keybindings
(global-set-key "\C-c\C-e" 'eval-expression)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-d\C-l" 'joshua-delete-leading-whitespace)
(global-set-key "\C-c\C-d\C-b" 'joshua-backward-kill-line)
(global-set-key (kbd "S-C-<right>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; Org Mode keybindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(global-set-key (kbd "<escape>") 'save-buffers-kill-terminal)
(global-set-key [f5] 'compile)
(global-set-key [f3] 'highlight-symbol-at-point)
(global-set-key [(control f3)] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
;;(global-set-key [(meta f3)] 'highlight-symbol-query-replace)
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
 '(which-func ((t (:foreground "light gray")))))
