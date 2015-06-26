;; Use-package setup ----------------------------------------------------------
(package-initialize)
(unless (assoc-default "melpa" package-archives)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;; Packages -------------------------------------------------------------------
(use-package solarized-theme
  :ensure t
  :config
  (defun solarized ()
    (interactive)
    (if (equal (car custom-enabled-themes) 'solarized-light)
        (load-theme 'solarized-dark)
      (load-theme 'solarized-light))))

(use-package smart-mode-line
  :ensure t
  :init
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'automatic)
  (sml/setup))

(use-package paradox
  :ensure t
  :init
  (setq paradox-github-token t))

(use-package move-dup
  :ensure t
  :bind (("M-<up>" . md/move-lines-up)
         ("M-<down>" . md/move-lines-down)
         ("M-S-<up>" . md/duplicate-up)
         ("M-S-<down>" . md/duplicate-down)))

(use-package undo-tree
  :ensure t
  :init (setq undo-tree-visualizer-relative-timestamps t
              undo-tree-visualizer-timestamps t)
  :config (global-undo-tree-mode t)
  :bind (("C-z" . undo-tree-undo)
         ("C-S-z" . undo-tree-redo))
  :diminish undo-tree-mode)

(use-package flycheck
  :ensure t
  :init (setq flycheck-completion-system 'ido)
  :config (add-hook 'python-mode-hook 'flycheck-mode))

(use-package rainbow-delimiters
  :ensure t
  :init (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package ido-ubiquitous
  :ensure t
  :init (ido-ubiquitous-mode 1))

(use-package ido-vertical-mode
  :ensure t
  :init (ido-vertical-mode))

(use-package flx-ido
  :ensure t
  :init
  (setq flx-ido-threshold 1000)
  (flx-ido-mode 1))

(use-package multiple-cursors
  :ensure t
  :bind (("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-*" . mc/mark-all-like-this)))

(use-package visual-regexp-steroids
  :ensure t
  :ensure visual-regexp
  :bind (("M-5" . vr/replace)
         ("M-%" . vr/query-replace)
         ("C-r" . vr/isearch-backward)
         ("C-s" . vr/isearch-forward)))

(use-package ag
  :ensure t
  :ensure wgrep
  :ensure wgrep-ag
  :config
  (bind-keys :map ag-mode-map
             ("q" . kill-this-buffer))
  (setq ag-highlight-search t))

(use-package golden-ratio
  :ensure t
  :diminish golden-ratio-mode
  :init
  (golden-ratio-mode 1)
  (setq golden-ratio-auto-scale t))

(use-package aggressive-indent
  :ensure t
  :diminish aggressive-indent-mode
  :init
  (global-aggressive-indent-mode 1)
  (add-to-list 'aggressive-indent-excluded-modes 'html-mode)
  (unbind-key "C-c C-q" aggressive-indent-mode-map))

(use-package winner
  :ensure t
  :init (winner-mode))

(use-package syntax-subword
  :ensure t
  :init (global-syntax-subword-mode)
  :config
  (defun forward-delete-word (arg)
    (interactive "p")
    (delete-region (point) (progn (syntax-subword-forward arg) (point))))
  (defun backward-delete-word (arg)
    (interactive "p")
    (delete-region (point) (progn (syntax-subword-backward arg) (point))))
  :bind (("C-<delete>" . forward-delete-word)
         ("C-<backspace>" . backward-delete-word)))

(use-package markdown-mode
  :ensure t
  :mode (("\\.text$" . markdown-mode)
         ("\\.markdown$" . markdown-mode)
         ("\\.md$" . markdown-mode)))

(use-package company
  :ensure t
  :init (add-hook 'prog-mode-hook 'company-mode)
  :config
  (setq company-idle-delay 0.2
        ;; min prefix of 2 chars
        company-minimum-prefix-length 2
        company-selection-wrap-around t
        company-show-numbers t
        company-dabbrev-downcase nil
        company-transformers '(company-sort-by-occurrence))
  (bind-keys :map company-active-map
             ("C-n" . company-select-next)
             ("C-p" . company-select-previous)
             ("C-d" . company-show-doc-buffer)
             ("<tab>" . company-complete))
  :bind ("C-." . company-complete))

(use-package anaconda-mode
  ;; Requires pip packages: jedi service_factory
  :ensure t
  :config
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'eldoc-mode))

(use-package company-anaconda
  :ensure t
  :config
  (add-to-list 'company-backends 'company-anaconda))

(use-package js2-mode
  :ensure t
  :mode (("\\.js$" . js2-mode)))

(use-package tern
  :ensure t
  :ensure company-tern
  :config
  (setq tern-command '("tern"))
  (add-hook 'js2-mode-hook 'tern-mode))

(use-package company-tern
  :ensure t
  :config (add-to-list 'company-backends 'company-tern))

(use-package projectile
  :defer t
  :ensure t
  :ensure helm-projectile
  :diminish projectile-mode
  :config
  (setq projectile-keymap-prefix (kbd "C-c p"))
  (setq projectile-enable-caching t)
  (add-hook 'prog-mode-hook 'projectile-global-mode))

(use-package helm-projectile
  :ensure t
  :config
  (setq projectile-completion-system 'helm)
  (setq projectile-indexing-method 'alien)
  (helm-projectile-on))

;; Custom functions -----------------------------------------------------------

;; Custom key bindings --------------------------------------------------------
(windmove-default-keybindings) ; Defaults: s-up,down,left,right

;; Misc customizes ------------------------------------------------------------
(fset 'yes-or-no-p 'y-or-n-p)
(set-frame-font "Meslo LG S DZ-10")

;; Customize feature ----------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(apropos-do-all t)
 '(apropos-sort-by-scores t)
 '(auto-save-default nil)
 '(before-save-hook (quote (whitespace-cleanup)))
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(cursor-type (quote bar))
 '(custom-enabled-themes (quote (solarized-light)))
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "26614652a4b3515b4bbbb9828d71e206cc249b67c9142c06239ed3418eff95e2" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(custom-theme-load-path
   (quote
    ("~/.emacs.d/elpa/solarized-theme-20150424.53/" custom-theme-directory t)))
 '(default-frame-alist (quote ((font . "Meslo LG S DZ-10"))))
 '(delete-selection-mode t)
 '(echo-keystrokes 0.25)
 '(fill-column 79)
 '(flycheck-completion-system (quote ido))
 '(global-hl-line-mode t)
 '(global-hl-line-sticky-flag t)
 '(global-subword-mode t)
 '(ibuffer-default-sorting-mode (quote major-mode))
 '(ido-enable-dot-prefix t)
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(ido-use-faces nil)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(keyboard-coding-system (quote utf-8-unix))
 '(make-backup-files nil)
 '(make-cursor-line-fully-visible nil)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount (quote (3 ((shift) . 1) ((control)))))
 '(scroll-conservatively 101)
 '(show-paren-mode t)
 '(text-mode-hook
   (quote
    (turn-on-flyspell text-mode-hook-identify visual-line-mode)))
 '(words-include-escapes t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
