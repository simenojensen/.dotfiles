;; Load separate file for Emacs automatically added custom settings
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Disable GUI
(setq ring-bell-function 'ignore)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(setq confirm-kill-processes nil)


;; Default Settings
(show-paren-mode t)
(setq scroll-conservatively 101)


;; Save Work Space
(desktop-save-mode t)
(save-place-mode t)

;; Create Backup Directory
(customize-set-variable
 'backup-directory-alist
 `(("." . ,(concat user-emacs-directory "backups"))))

;; Security
(setq gnutls-verify-error t)
(setq tls-checktrust t)

;; Package Manager
;; https://github.com/raxod502/straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


;; use-package
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; Change Font Size
(cond ((eq system-type 'darwin)
       (customize-set-variable 'mac-command-modifier 'meta)
       (customize-set-variable 'mac-option-modifier 'alt)
       (customize-set-variable 'mac-right-option-modifier 'super)
       (bind-key "M-+" 'text-scale-increase)
       (bind-key "M-=" 'text-scale-increase)
       (bind-key "M--" 'text-scale-decrease))
      ((eq system-type 'windows-nt)
       )
      ((eq system-type 'gnu/linux)
       ))


