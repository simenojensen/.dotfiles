;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Default Behaviour
(setq inhibit-startup-message t)
(setq backup-directory-alist `(("." . "~/.emacs.saves")))
(tool-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "<f5>") 'revert-buffer)
(defalias 'list-buffers 'ibuffer-other-window)
;; (winner-mode 1) ;; remember window arrangement
;; (windmove-default-keybindings) ;; use shift to move between windows
(setq save-interprogram-paste-before-kill t)
(global-auto-revert-mode 1)
(desktop-save-mode 1)
(setq auto-revert-verbose nil)

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (setq which-key-idle-delay 0.2)
  (which-key-mode))

(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
     ((t (:inherit ace-jump-face-foreground :height 3.0)))))))

(use-package counsel
  :ensure t
  :bind
  (("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line)))

(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy))


(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
	 ("C-r" . swiper)
	 ("C-c C-r" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

(load-theme 'leuven t)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package ox-reveal
:ensure ox-reveal)

(setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
(setq org-reveal-mathjax t)

(use-package htmlize
:ensure t)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(use-package jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-hook 'python-mode-hook 'jedi:ac-setup))

(use-package elpy
  :ensure t
  :config
  (elpy-enable))

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))

(global-hl-line-mode t)

(use-package beacon
  :ensure t
  :config
  (beacon-mode 1))

(use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode))

(use-package aggressive-indent
  :ensure t
  :config
  (global-aggressive-indent-mode 1))

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))

(use-package iedit
  :ensure t)
