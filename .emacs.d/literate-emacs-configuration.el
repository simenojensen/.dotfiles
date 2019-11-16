;;; -*- lexical-binding: t -*-
(setq-default lexical-binding t)

(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs startup took %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

(let ((file-name-handler-alist nil))

(setq debug-on-error t)

(setq gc-cons-threshold most-positive-fixnum)

(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(customize-set-variable 'package-archives
                        '(("marmalade" . "https://marmalade-repo.org/packages/")
                          ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(when (not (package-installed-p 'use-package))
  (package-install 'use-package))

(require 'use-package)

(customize-set-variable 'use-package-always-ensure t)

(customize-set-variable 'use-package-always-defer t)

(customize-set-variable 'use-package-verbose t)

(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

(use-package quelpa
  :defer nil)

(use-package quelpa-use-package
  :defer nil
  :after quelpa)

(customize-set-variable 'load-prefer-newer t)

(use-package auto-compile
  :defer nil
  :config (auto-compile-on-load-mode))

(add-to-list 'load-path "~/.emacs.d/lisp")

(use-package cl-lib)

(add-hook 'before-save-hook 'time-stamp)

(customize-set-variable 'kill-whole-line t)

(customize-set-variable 'mouse-yank-at-point t)

(setq completion-ignore-case t)
(customize-set-variable 'read-file-name-completion-ignore-case t)
(customize-set-variable 'read-buffer-completion-ignore-case t)

(when (>= emacs-major-version 26)
  (use-package display-line-numbers
    :defer nil
    :ensure nil
    :config
    (global-display-line-numbers-mode)))

(customize-set-variable 'show-trailing-whitespace t)

(show-paren-mode)

(customize-set-variable 'indent-tabs-mode nil)

(customize-set-variable
 'backup-directory-alist
 `(("." . ,(concat user-emacs-directory "backups"))))

(when (fboundp 'winner-mode) (winner-mode))

(use-package unfill
  :bind
  ("M-q" . unfill-toggle)
  ("A-q" . unfill-paragraph))

(use-package saveplace
  :defer nil
  :config
  (save-place-mode))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(customize-set-variable 'ad-redefinition-action 'accept)

(cond ((eq system-type 'darwin)
       (customize-set-variable 'mac-command-modifier 'meta)
       (customize-set-variable 'mac-option-modifier 'alt)
       (customize-set-variable 'mac-right-option-modifier 'super)
       (bind-key "M-+" 'text-scale-increase)
       (bind-key "M-=" 'text-scale-increase)
       (bind-key "M--" 'text-scale-decrease)
       (defun so/text-scale-reset ()
         (interactive)
         (text-scale-set 0))
       
       (bind-key "M-0" 'so/text-scale-reset)
       (use-package exec-path-from-shell
         :defer nil
         :config
         (exec-path-from-shell-initialize))
       )
      ((eq system-type 'windows-nt)
       
       )
      ((eq system-type 'gnu/linux)
       
       ))

(use-package which-key
  :defer nil
  :diminish which-key-mode
  :config
  (which-key-mode))

(use-package bind-key)

(use-package crux
  :ensure t
  :bind (("C-a" . crux-move-beginning-of-line)))

(bind-key "M-g" 'goto-line)

(bind-key "M-`" 'other-frame)

(bind-key "M-n" 'make-frame-command)

(bind-key "A-w" 'delete-frame)

(when (>= emacs-major-version 26)
  (pixel-scroll-mode))

(global-visual-line-mode 1)

(setq ring-bell-function 'ignore)

(defalias 'yes-or-no-p 'y-or-n-p)

(use-package diminish
  :defer nil)

;;(use-package solarized-theme)
;;(use-package darktooth-theme)
;;(use-package kaolin-themes)
(use-package gruvbox-theme)
(load-theme 'gruvbox)

(use-package smart-mode-line
  :defer 2
  :config
  (sml/setup)
  :custom
  (sml/theme 'dark)
  (sml/replacer-regexp-list
   '(("^~/\\.emacs\\.d/elpa/"                            ":ELPA:")
     ("^~/\\.emacs\\.d/"                                 ":ED:")
     ("^/sudo:.*:"                                       ":SU:")
     ("^~/Documents/"                                    ":Doc:")
     ("^:\\([^:]*\\):Documento?s/"                       ":\\1/Doc:"))))

(use-package desktop
  :defer nil
  :custom
  (desktop-restore-eager   1 "Restore the first buffer right away")
  (desktop-lazy-idle-delay 1 "Restore the other buffers 1 second later")
  (desktop-lazy-verbose  nil "Be silent about lazily opening buffers")
  :bind
  ("C-M-s-k" . desktop-clear)
  :config
  (desktop-save-mode))

(use-package uniquify
  :defer 1
  :ensure nil
  :custom
  (uniquify-after-kill-buffer-p t)
  (uniquify-buffer-name-style 'post-forward)
  (uniquify-strip-common-suffix t))

(use-package hl-line
  :defer nil
  :config
  (global-hl-line-mode))

(use-package recentf
:defer 1
:custom
(recentf-max-menu-items 100)
(recentf-max-saved-items 100)
:init
(recentf-mode))

(use-package smex
  :config (smex-initialize))

(use-package ibuffer
  :disabled
  :bind
  ("C-x C-b" . ibuffer-other-window))

(use-package ivy
  :diminish ivy-mode
  :config
  (setq ivy-initial-inputs-alist nil)
  (ivy-mode t))

(use-package counsel
  :bind ("M-x" . counsel-M-x))

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode 1))

)

(setq gc-cons-threshold (* 2 1000 1000))
