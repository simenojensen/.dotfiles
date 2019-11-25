(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

(let ((file-name-handler-alist nil))

(setq debug-on-error t)

(setq gc-cons-threshold most-positive-fixnum)

(require 'package)

(setq-default package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                                 ("melpa" . "https://melpa.org/packages/")
                                 ("org" . "https://orgmode.org/elpa/")
                                 ;; ("marmalade" . "https://marmalade-repo.org/packages/")
                                 ))

(setq tls-checktrust t)

;; This snippet is ready to work in both UNIX-like and Windows OS
(let ((trustfile
       (replace-regexp-in-string
        "\\\\" "/"
        (replace-regexp-in-string
         "\n" ""
         (shell-command-to-string (concat "python3 -m certifi"))))))
  (setq tls-program
        (list
         (format "gnutls-cli%s --x509cafile %s -p %%p %%h"
                 (if (eq window-system 'w32) ".exe" "") trustfile)))
  ;; (setq gnutls-verify-error t)
  (setq gnutls-trustfiles (list trustfile)))

(package-initialize)

(setq-default package-enable-at-startup nil)

(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

(require 'use-package-ensure)
(setq-default use-package-always-ensure t)

(use-package auto-package-update
  :config
  (setq-default auto-package-update-delete-old-versions t)
  (setq-default auto-package-update-hide-results t)
  (auto-package-update-maybe))

(setq-default load-prefer-newer t)

(use-package auto-compile
  :config
  (auto-compile-on-load-mode)
(auto-compile-on-save-mode))

(require 'bind-key)

(use-package diminish)

(setq-default frame-title-format (list "[" user-login-name "@" (system-name) "] %b"))

(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

(setq-default inhibit-startup-screen t)

(setq-default initial-scratch-message nil)

(setq-default custom-file "~/.emacs.d/custom.el")
(load custom-file)

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

(setq-default fill-column 80)

(global-visual-line-mode 1)

(setq-default indent-tabs-mode nil)

(setq-default scroll-conservatively 101)

(fset 'yes-or-no-p 'y-or-n-p)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(global-auto-revert-mode t)

(desktop-save-mode t)

(save-place-mode t)

(global-hl-line-mode t)

(add-hook 'before-save-hook 'time-stamp)

(setq large-file-warning-threshold 100000000)

(menu-bar-mode -1)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(blink-cursor-mode -1)

(setq-default ring-bell-function 'ignore)

(use-package ace-window
  :init
  (custom-set-faces
   '(aw-leading-char-face
     ((t (:inherit ace-jump-face-foreground :height 3.0)))))
  :bind
  ("C-x o" . ace-window))

(use-package smex)

(use-package counsel
  :bind
  ("C-x C-f" . counsel-find-file)
  ("<f1> f" . counsel-describe-function)
  ("<f1> v" . counsel-describe-variable)
  ("<f1> l" . counsel-find-library)
  ("<f1> i" . counsel-info-lookup-symbol)
  ("<f1> u" . counsel-unicode-char)
  ("<f1> j" . counsel-set-variable)
  ("M-x" . counsel-M-x))

(use-package ivy
  :diminish
  :bind
  ("C-x b" . ivy-switch-buffer)
  :config
  (ivy-mode 1)
  (setq ivy-initial-inputs-alist nil)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) "))

(use-package swiper
    :bind
    ("C-s" . swiper-isearch))

(use-package undo-tree
  :diminish
  :bind ("C-x u" . undo-tree-visualize)
  :config
  (global-undo-tree-mode))

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(defun my/toggle-comment-on-line ()
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

(bind-key "C-;" 'my/toggle-comment-on-line)

(defun my/reload-emacs-configuration ()
  "Reloads init.el."
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(cond

((eq system-type 'darwin)

(customize-set-variable 'mac-command-modifier 'meta)
(customize-set-variable 'mac-option-modifier 'alt)
(customize-set-variable 'mac-right-option-modifier 'super)

(bind-key "M-+" 'text-scale-increase)
(bind-key "M--" 'text-scale-decrease)

(defun my/text-scale-reset ()
  "Reset text scaling to default"
  (interactive)
  (text-scale-set 0))

(bind-key "M-0" 'my/text-scale-reset)

(use-package exec-path-from-shell
  :defer nil
  :config
  (exec-path-from-shell-initialize))
)

((eq system-type 'windows-nt))

((eq system-type 'gnu/linux))
)

(use-package which-key
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.5)
  (which-key-mode))

(bind-key "M-g" 'goto-line)

(bind-key "M-n" 'make-frame)

(bind-key "M-`" 'other-frame)

(bind-key "M-w" 'delete-frame)
(bind-key "A-w" 'kill-ring-save)

(use-package crux
  :bind ("C-a" . crux-move-beginning-of-line))

(use-package org
  :ensure org-plus-contrib
  :pin org
  :defer t)

;; Ensure ELPA org is prioritized above built-in org.
(require 'cl)
(setq load-path (remove-if (lambda (x) (string-match-p "org$" x)) load-path))

(use-package toc-org
  :after org
  :hook (org-mode . toc-org-enable))

;;(use-package solarized-theme)
;;(use-package darktooth-theme)
;;(use-package kaolin-themes)
(use-package gruvbox-theme)
(load-theme 'gruvbox)

(use-package iedit
  :bind
  ("M-;" . iedit-mode))

(use-package anaconda-mode
  :config
  :hook ((python-mode . anaconda-mode)
         (python-mode . anaconda-eldoc-mode)))

)

(setq gc-cons-threshold (* 2 1000 1000))
