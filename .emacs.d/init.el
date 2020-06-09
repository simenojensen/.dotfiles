(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

(setq debug-on-error t)

(setq gc-cons-threshold most-positive-fixnum)

(require 'package)

(setq-default package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                                 ("melpa" . "https://melpa.org/packages/")
                                 ("org" . "https://orgmode.org/elpa/")))

(package-initialize)

(setq-default package-enable-at-startup nil)

(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t)

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

(use-package try)

(setq-default frame-title-format (list "[" user-login-name "@" (system-name) "] %b"))

(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

(setq column-number-mode t)

(setq-default inhibit-startup-screen t)

(setq-default initial-scratch-message nil)

(setq-default custom-file "~/.emacs.d/custom.el")
(load custom-file)

(setq-default create-lockfiles nil)

(setq-default backup-directory-alist '(("." . "/Users/simenojensen/.emacs.d/backups")))

(setq-default fill-column 80)

(global-visual-line-mode t)

(setq-default indent-tabs-mode nil)

(setq-default scroll-conservatively 101)

(fset 'yes-or-no-p 'y-or-n-p)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(global-auto-revert-mode t)

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

(setq-default confirm-kill-emacs nil)

(setq-default confirm-kill-processes nil)

(use-package smex)

(use-package counsel
  :bind
  ("C-x C-f" . counsel-find-file)
  ("C-h f" . counsel-describe-function)
  ("C-h v" . counsel-describe-variable)
  ("C-h l" . counsel-find-library)
  ("C-h i" . counsel-info-lookup-symbol)
  ("C-h u" . counsel-unicode-char)
  ("M-x" . counsel-M-x)
  ("M-v" . counsel-yank-pop))

(use-package ivy
  :diminish
  :bind
  ("C-x b" . ivy-switch-buffer)
  :config
  (ivy-mode 1)
  (setq ivy-initial-inputs-alist nil)
  (setq ivy-display-style 'fancy)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) "))

(use-package swiper
  :bind
  ("C-s" . swiper-isearch))

(use-package ace-window
  :bind
  ("C-x o" . ace-window)
  :init
  (custom-set-faces
   '(aw-leading-char-face
     ((t (:inherit ace-jump-face-foreground :height 3.0))))))

(winner-mode 1)

(use-package expand-region
  :bind
  ("C-=" . er/expand-region))

(use-package iedit
  :bind
  ("M-;" . iedit-mode))

(use-package hungry-delete
  :config
  (global-hungry-delete-mode))

(use-package projectile
  :diminish
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-completion-system 'ivy)
  (projectile-mode +1))

(use-package yasnippet
  :diminish
  :config
  (use-package yasnippet-snippets
    :diminish)
  (yas-global-mode 1))

(use-package flycheck
  :diminish
  :init
  (global-flycheck-mode))

(use-package undo-tree
  :diminish
  :bind
  ("C-x u" . undo-tree-visualize)
  :config
  (global-undo-tree-mode))

;; (use-package aggressive-indent
  ;; :hook
  ;; (python-mode . aggressive-indent-mode))

(defun my/toggle-comment-on-line ()
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

(bind-key "C-;" 'my/toggle-comment-on-line)

(use-package company
  :diminish
  :bind (:map company-active-map
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous))
  :config
  (setq-default company-idle-delay 0)
  (setq company-minimum-prefix-length 3)
  (global-company-mode t))

(use-package pos-tip)

(use-package company-quickhelp
  :config
  (company-quickhelp-mode))

(use-package company-statistics
  :config
  (company-statistics-mode))

(use-package company-jedi
  :diminish
  :config
  (setq-default jedi:complete-on-dot t)
  (eval-after-load "company-jedi"
    '(setq jedi:server-command (list "/usr/local/Caskroom/miniconda/base/envs/emacs-jedi/bin/python" jedi:server-script)))
  (defun my/python-mode-hook ()
    (add-to-list 'company-backends 'company-jedi))
  :hook
  (python-mode . my/python-mode-hook)
  (python-mode . jedi:setup)
  (conda-postactivate . jedi:stop-server)
  (conda-postdeactivate . jedi:stop-server))

(cond

((eq system-type 'darwin)

(customize-set-variable 'mac-command-modifier 'meta)
(customize-set-variable 'mac-option-modifier 'alt)
(customize-set-variable 'mac-right-command-modifier 'super)

(bind-key "M-=" 'text-scale-increase)
(bind-key "M--" 'text-scale-decrease)

(defun my/text-scale-reset ()
  "Reset text scaling to default"
  (interactive)
  (text-scale-set 0))

(bind-key "M-0" 'my/text-scale-reset)

(use-package exec-path-from-shell
  :defer nil
  :config
  (setq exec-path-from-shell-variables  '("PATH" "MANPATH" "AIRTABLE_API_KEY" "TSICLIENT_ENVIRONMENT_NAME" "TSICLIENT_TENANT_ID" "TSICLIENT_CLIENT_ID" "TSICLIENT_CLIENT_SECRET" "TSICLIENT_APPLICATION_NAME" "VIRTUAL_ENV" "LANG" "LC_ALL" "LC_CTYPE"))
  (exec-path-from-shell-initialize))
) ;; closing parenthesis

((eq system-type 'windows-nt))

((eq system-type 'gnu/linux))
)

;;(use-package solarized-theme)
;;(use-package darktooth-theme)
;;(use-package kaolin-themes)
(use-package gruvbox-theme
  :config
  (load-theme 'gruvbox))

(use-package paren
  :config
  (show-paren-mode t)
  (set-face-background 'show-paren-match "#EC7063")
  (set-face-foreground 'show-paren-match "Red1")
  (set-face-attribute 'show-paren-match nil :weight 'extra-bold))

(use-package beacon
  :config
  (beacon-mode 1)
  (setq beacon-color "#39FF14"))

(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))

(use-package dimmer
  :config
  (setq dimmer-fraction 0.5)
  (dimmer-mode t))

(use-package org
  :pin org
  :config
  (add-to-list 'org-modules 'org-tempo)) ;; add "<s <TAB>" for code block completion

(use-package toc-org
  :after org
  :hook
  (org-mode . toc-org-enable))

(use-package org-bullets
  :hook
  (org-mode . (lambda () (org-bullets-mode t))))

(use-package ox-reveal
  :ensure ox-reveal
  :config
  (setq org-reveal-root "/Users/simenojensen/.emacs.d/reveal.js/")
  (setq org-reveal-mathjax t))

(use-package htmlize)

;; (setq python-shell-interpreter "jupyter"
;;       python-shell-interpreter-args "console --simple-prompt"
;;       python-shell-prompt-detect-failure-warning nil)

;; (setq python-shell-interpreter "ipython"
;;       python-shell-interpreter-args "--simple-prompt -i")

;; (defun my/add-python-shell-completion-native-disabled-interpreters ()
;;   (add-to-list 'python-shell-completion-native-disabled-interpreters "jupyter"))

;; (add-hook 'python-mode-hook 'my/add-python-shell-completion-native-disabled-interpreters)

(use-package conda
  :init
  (setq conda-anaconda-home "/usr/local/Caskroom/miniconda/base/")
  :config
  (conda-env-initialize-interactive-shells) ;; interactive shell support
  (conda-env-initialize-eshell)             ;; eshell support
  (conda-env-autoactivate-mode t))          ;; autoactivate

(use-package ein
  :config
  (setq ein:output-area-inlined-images t))

;; (use-package insert-shebang)

(use-package vterm
  :config
  (defun my/vterm ()
    "Always start emacs with vterm in at the bottom of the screen"
    (interactive)
    (delete-other-windows)
    (split-window-vertically)
    (other-window 1)
    (minimize-window)
    (enlarge-window 30)
    (vterm)))
  ;; :hook
  ;; (emacs-startup . my/vterm))

(use-package restart-emacs)

;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun my/rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

(defun goto-match-paren (arg)
    "Go to the matching parenthesis if on parenthesis. Else go to the
  opening parenthesis one level up."
    (interactive "p")
    (cond ((looking-at "\\s\(") (forward-list 1))
          (t
           (backward-char 1)
           (cond ((looking-at "\\s\)")
                  (forward-char 1) (backward-list 1))
                 (t
                  (while (not (looking-at "\\s("))
                    (backward-char 1)
                    (cond ((looking-at "\\s\)")
                           (message "->> )")
                           (forward-char 1)
                           (backward-list 1)
                           (backward-char 1)))))))))

;; use only one desktop
(setq desktop-path '("~/.emacs.d/"))
(setq desktop-dirname "~/.emacs.d/")
(setq desktop-base-file-name "emacs-desktop")

(defun saved-session ()
  (file-exists-p (concat desktop-dirname "/" desktop-base-file-name)))

;; use session-restore to restore the desktop manually
(defun session-restore ()
  "Restore a saved emacs session."
  (interactive)
  (if (saved-session)
      (desktop-read)
    (message "No desktop found.")))

;; use session-save to save the desktop manually
(defun session-save ()
  "Save an emacs session."
  (interactive)
  (if (saved-session)
      (if (y-or-n-p "Overwrite existing desktop? ")
          (desktop-save-in-desktop-dir)
        (message "Session not saved."))
  (desktop-save-in-desktop-dir)))

;; ask user whether to restore desktop at start-up
(add-hook 'after-init-hook
          '(lambda ()
             (if (saved-session)
                 (if (y-or-n-p "Restore desktop? ")
                     (session-restore)))))

(use-package google-this
  :diminish
  :config
  (google-this-mode t))

(use-package which-key
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.5)
  (which-key-mode))

(bind-key "M-g" 'goto-line)

(bind-key "M-r" 'revert-buffer)

(use-package crux
  :bind
  ("C-a" . crux-move-beginning-of-line))

(bind-key "C-M-n" 'goto-match-paren)

(bind-key "C-x C-b" 'ibuffer)

(use-package magit
  :bind
  ("C-x g" . magit-status))

(use-package powerline
  :config
  (powerline-default-theme))

(use-package all-the-icons)

(use-package emojify
  :hook
  (after-init . global-emojify-mode))

;; (use-package mode-icons)

(use-package tex-site
  :ensure auctex
  :mode ("\\.tex\\'" . latex-mode)
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq TeX-save-query nil)
  (setq TeX-PDF-mode t)
  (setq-default TeX-master nil))

(setq gc-cons-threshold (* 2 1000 1000))
