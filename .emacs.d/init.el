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

;; Marmalade package management
;;(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

;; Turn on hydra examples
(setq hydra-examples-verbatim t)

(require 'ido)
(ido-mode t)

(require 'whitespace)
(require 'hydra)
(require 'hydra-examples)
(require 'ggtags)
(require 'company)
(require 'magit)

;; My personal code
(require 'joshua-c)
(require 'joshua-diff)

;; company mode initialization
(add-hook 'after-init-hook 'global-company-mode)
(setq company-backends (delete 'company-semantic company-backends))
;; 
;; (define-key c++-mode-map  [(tab)] 'company-complete)

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

;; Command line switches
(add-to-list 'command-switch-alist '("diff" . joshua-command-line-diff))

;; Custom Keybindings
(global-set-key "\C-c\C-e" 'eval-expression)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key (kbd "S-C-<right>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(global-set-key (kbd "C-x g") 'magit-status)

(global-set-key [f3] 'highlight-symbol-at-point)
(global-set-key [(control f3)] 'highlight-symbol-query-replace)
(global-set-key [f12] 'call-last-kbd-macro)

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

;;(define-key c-mode-base-map [(tab)] 'company-complete)
;;(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)


;; Hydra keybindings
;;(define-key Buffer-menu-mode-map "." 'hydra-buffer-menu/body)


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
