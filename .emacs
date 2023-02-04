;; Emacs server
;; (server-start)

(setq user-full-name "Joshua Hayworth")
(setq user-mail-address "joshua@hayworthfamily.com")

;; Additions to load path
(add-to-list 'load-path (expand-file-name "~/emacs"))
(add-to-list 'load-path (expand-file-name "~/Work/Emacs-libraries/hydra"))       ;; Add hydra
(add-to-list 'load-path (expand-file-name "~/Work/Emacs-libraries/emacs-async")) ;; Async (dependency of helm) - https://github.com/jwiegley/emacs-async
(add-to-list 'load-path (expand-file-name "~/Work/Emacs-libraries/popup"))       ;; popup.el (depnedency of helm) - https://github.com/auto-complete/popup-el

;; Async
(autoload 'dired-async-mode "dired-async.el" nil t)
(dired-async-mode 1)

;; Helm
;; This is loaded automatically from /usr/local/share/emacs/site-lisp/helm
(require 'helm)
(require 'helm-config)

;; ispell dictionary
(require 'ispell)

;; Hydra mode
(require 'hydra)

;; Yasnippet
;; (require 'yasnippet)

(require 'joshua-machinespecific)   ;; Machine specific configuration
(require 'joshua-ui)                ;; General UI Startup
(require 'joshua-general)           ;; Personal Utility functions
(require 'joshua-org)               ;; Org mode specific configuration
;; (require 'joshua-mail)              ;; E-mail configuration
(require 'joshua-c)                 ;; C Language specific configuration
;; (require 'joshua-js)                ;; Java Language specific configuration
;; (require 'joshua-eshell)            ;; Emacs shell specific configuration
;; (require 'joshua-python)            ;; Python specific configuration
(require 'joshua-projects)          ;; Project specific initialization

;; Yas snippets
;; (yas-global-mode 1)

;;(setq yas-snippet-dirs
;;      '("~/.emacs.d/snippets"))                 ;; personal snippets

;; Edit Server
;;(require 'edit-server)
;;(edit-server-start)

;; Shell mode
(setq ansi-color-names-vector ; better contrast colors
      ["black" "red4" "green4" "yellow4"
       "blue3" "magenta4" "cyan4" "white"])

;;(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;;(add-hook 'shell-mode-hook
;;     '(lambda () (toggle-truncate-lines 1)))
;;(setq comint-prompt-read-only t)

;; Setup aspell
;; (setq ispell-program-name "aspell")
;; (setq ispell-personal-dictionary "~/.personaldictionary")
;; (setq ispell-list-command "--list")

;; Helm
(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 20)
(helm-autoresize-mode 1)
(helm-mode 1)

;; Helm Keybindings
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") #'helm-find-files)

;; Other custom nonsense
(global-set-key "\C-x\C-m" 'helm-M-x)
(global-set-key "\C-c\C-m" 'helm-M-x)
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
(global-set-key [f4] 'whitespace-mode)
(global-set-key [f5] 'compile)
(global-set-key [f12] 'call-last-kbd-macro)
(global-set-key (kbd "C-S-d") 'duplicate-line)
(global-set-key (kbd "C-S-j") 'move-line-down)
(global-set-key (kbd "C-S-k") 'move-line-up)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(defhydra hydra-buffer-menu (:color pink
                             :hint nil)
  "
^Mark^             ^Unmark^           ^Actions^          ^Search
^^^^^^^^-----------------------------------------------------------------
_m_: mark          _u_: unmark        _x_: execute       _R_: re-isearch
_s_: save          _U_: unmark up     _b_: bury          _I_: isearch
_d_: delete        ^ ^                _g_: refresh       _O_: multi-occur
_D_: delete up     ^ ^                _T_: files only: % -28`Buffer-menu-files-only
_~_: modified
"
  ("m" Buffer-menu-mark)
  ("u" Buffer-menu-unmark)
  ("U" Buffer-menu-backup-unmark)
  ("d" Buffer-menu-delete)
  ("D" Buffer-menu-delete-backwards)
  ("s" Buffer-menu-save)
  ("~" Buffer-menu-not-modified)
  ("x" Buffer-menu-execute)
  ("b" Buffer-menu-bury)
  ("g" revert-buffer)
  ("T" Buffer-menu-toggle-files-only)
  ("O" Buffer-menu-multi-occur :color blue)
  ("I" Buffer-menu-isearch-buffers :color blue)
  ("R" Buffer-menu-isearch-buffers-regexp :color blue)
  ("c" nil "cancel")
  ("v" Buffer-menu-select "select" :color blue)
  ("o" Buffer-menu-other-window "other-window" :color blue)
  ("q" quit-window "quit" :color blue))

(define-key Buffer-menu-mode-map "." 'hydra-buffer-menu/body)


(setq smerge-command-prefix "\C-c v")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(sanityinc-tomorrow-night))
 '(custom-safe-themes
   '("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default))
 '(package-selected-packages
   '(transient git-commit find-file-in-project f dockerfile-mode debbugs)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
