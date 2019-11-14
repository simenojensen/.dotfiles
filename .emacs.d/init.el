(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

(let ((file-name-handler-alist nil))

;; (setq debug-on-error t)

(setq gc-cons-threshold most-positive-fixnum)

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

(customize-set-variable 'use-package-verbose nil)

(use-package quelpa
             :defer nil)

(use-package quelpa-use-package
             :defer nil
             :after quelpa)

(customize-set-variable 'load-prefer-newer t)
(use-package auto-compile
  :defer nil
  :config (auto-compile-on-load-mode))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'cl)

(server-start)

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

(customize-set-variable 'backup-directory-alist
                        `(("." . ,(concat user-emacs-directory "backups"))))

(show-paren-mode)

(customize-set-variable 'indent-tabs-mode nil)'

(use-package unfill
  :bind
  ("M-q" . unfill-toggle)
  ("A-q" . unfill-paragraph))

(use-package saveplace
  :defer nil
  :config
  (save-place-mode))

(use-package smooth-scrolling
  :config
  (smooth-scrolling-mode 1))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(customize-set-variable 'ad-redefinition-action 'accept)

(when (fbound 'winner-mode) (winner-mode))

)
