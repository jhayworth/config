;; Package management
(require 'package)

(defun require-package (package)
  "Install given PACKAGE if it was not installed before."
  (if (package-installed-p package)
      t
    (progn
      (unless (assoc package package-archive-contents)
    (package-refresh-contents))
      (package-install package))))

(setq package-archives '(("melpa-stable" . "http://stable.melpa.org/packages/")
                         ("melpa"        . "http://melpa.milkbox.net/packages/")
		         ("org"          . "https://orgmode.org/elpa/")
                         ("gnu"          . "http://elpa.gnu.org/packages/")))
(package-initialize)

(provide 'joshua-init)
