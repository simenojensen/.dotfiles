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

(defun check-tls-config ()
  "Check for correctness in the TLS configuration for Emacs."
  (interactive)
  (let ((bad-hosts
         (cl-loop for bad
               in `("https://wrong.host.badssl.com/"
                    "https://self-signed.badssl.com/")
               if (condition-case e
                      (url-retrieve
                       bad (lambda (retrieved) t))
                    (error nil))
               collect bad)))
    (if bad-hosts
        (error (format "TLS misconfigured; retrieved %s ok" bad-hosts))
      (url-retrieve "https://badssl.com"
                    (lambda (retrieved) t)))))

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

(setq-default frame-title-format (list "[" user-login-name "@" (system-name) "] %b"))

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
  :bind
  ("C-x b" . ivy-switch-buffer)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) "))

(use-package swiper
    :bind
    ("C-s" . swiper-isearch))

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

(use-package diminish)

;;(use-package solarized-theme)
;;(use-package darktooth-theme)
;;(use-package kaolin-themes)
(use-package gruvbox-theme)
(load-theme 'gruvbox)

(use-package iedit
  :bind
  ("M-;" . iedit-mode))

(use-package company
  :hook
  (after-init . global-company-mode))

(use-package anaconda-mode
  :init
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
  :config
  (setq python-indent-offset 4
        python-indent 4
        python-shell-interpreter "ipython"
        python-shell-interpreter-args "--single-prompt")
  (use-package company-anaconda
    :init
    (eval-after-load "company"
      '(add-to-list 'company-backends '(company-anaconda :with company-capf)))))

(use-package conda
  :config
  (setq conda-anaconda-home "/usr/local/Caskroom/miniconda")
  (setq conda-env-home-directory "/usr/local/Caskroom/miniconda")
  (conda-env-initialize-interactive-shells)
  (conda-env-initialize-eshell))

)

(setq gc-cons-threshold (* 2 1000 1000))
