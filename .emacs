(setq user-full-name "Joshua Hayworth")
(setq user-mail-address "joshua@hayworthfamily.com")

;; Package management
;;(require 'package)
;;(setq package-archives '(("melpa-stable" . "http://stable.melpa.org/packages/")
;;                         ("melpa"        . "http://melpa.milkbox.net/packages/")
;;                         ("marmalade"    . "http://marmalade-repo.org/packages/")
;;		         ("org"          . "http://orgmode.org/elpa/")
;;                         ("gnu"          . "http://elpa.gnu.org/packages/")))
;;(package-initialize)

;; Server code
(require 'server)
(setq server-use-tcp t)
(server-start)

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
(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins/yasnippet"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins/emacs_chrome"))

;; Theme load path
(add-to-list 'custom-theme-load-path "~/.emacs.d/color-themes")
(load-theme 'noctilux t)

;; My personal code
(require 'joshua-org)
(require 'joshua-c)
(require 'joshua-java)
(require 'joshua-js)
(require 'joshua-eshell)
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
(require 'edit-server)
(edit-server-start)

;; Magit
;; (require 'magit)

;; Shell mode
(setq ansi-color-names-vector ; better contrast colors
      ["black" "red4" "green4" "yellow4"
       "blue3" "magenta4" "cyan4" "white"])

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'shell-mode-hook
     '(lambda () (toggle-truncate-lines 1)))
(setq comint-prompt-read-only t)

; turn off line truncation by default
(set-default 'truncate-lines t)
(set-default 'truncate-partial-width-windows nil)

;; General cleanup
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Set smooth scrolling
(setq scroll-step 1
      scroll-conservatively 10000)

;; Setup aspell
(setq ispell-program-name "aspell")
(setq ispell-personal-dictionary "~/.personaldictionary")
(setq ispell-list-command "--list")

;; Custom Keybindings
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-c\C-e" 'eval-expression)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-x\C-b" 'buffer-menu)
(global-set-key (kbd "S-C-<right>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; Coding keybindings
(global-set-key [f3] 'highlight-symbol-at-point)
(global-set-key [(control f3)] 'highlight-symbol-query-replace)
(global-set-key [f12] 'call-last-kbd-macro)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

;; Org-mode keybindings
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; Magit keybindings
(global-set-key (kbd "C-x g") 'magit-status)

(delete-selection-mode t)

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
 '(default ((t (:inherit nil :stipple nil :background "#202020" :foreground "#cccccc" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "outline" :family "Fira Mono")))))
