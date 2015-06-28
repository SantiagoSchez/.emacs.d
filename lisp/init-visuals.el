;; Base config
(use-package init-visuals-base
  :init (provide 'init-visuals-base)
  :config
  (setq column-number-mode t
	default-frame-alist '((font . "Meslo LG S DZ-10"))
	echo-keystrokes 0.25
	global-hl-line-sticky-flag t
	inhibit-startup-screen t
	make-cursor-line-fully-visible nil)
  (set-default 'cursor-type 'bar)
  (set-frame-font "Meslo LG S DZ-10")
  (global-hl-line-mode)
  (show-paren-mode))

;; The Solarized light/dark theme
;; https://github.com/purcell/color-theme-sanityinc-solarized
(use-package color-theme-sanityinc-solarized
  :ensure t
  :init
  (if (display-graphic-p)
      (load-theme 'sanityinc-solarized-light t)
    (load-theme 'sanityinc-solarized-dark t))
  :config
  (defun light ()
    "Activate a light color theme."
    (interactive)
    (load-theme 'sanityinc-solarized-light t))
  (defun dark ()
    "Activate a dark color theme."
    (interactive)
    (load-theme 'sanityinc-solarized-dark t)))

;; Improves the mode line by showing and reorganizing the displayed information
;; Also it works nice with solarized theme
;; https://github.com/Malabarba/smart-mode-line/
(use-package smart-mode-line
  :ensure t
  :init
  (setq sml/no-confirm-load-theme t
	sml/theme 'light)
  (sml/setup)
  :config
  (defadvice light (after light-mode-line)
    (custom-set-faces
     '(mode-line-inactive ((t :foreground "grey20" :background "#fdf6e3" :inverse-video nil)))
     '(mode-line ((t :foreground "black" :background "grey85" :inverse-video nil))))
    (sml/apply-theme 'light))
  (ad-activate 'light)
  (defadvice dark (after dark-mode-line)
    (custom-set-faces
     '(mode-line-inactive ((t :foreground "gray60" :background "#51727a" :inverse-video nil)))
     '(mode-line ((t :foreground "gray60" :background "#073642" :inverse-video nil))))
    (sml/apply-theme 'dark))
  (ad-activate 'dark))

;; Colorful parens, brackets, curly braces, etc. by level
;; https://github.com/Fanael/rainbow-delimiters
(use-package rainbow-delimiters
  :ensure t
  :init (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; Highlight changes and other things visually
;; https://github.com/k-talo/volatile-highlights.el
(use-package volatile-highlights
  :defer t
  :ensure t
  :init
  (require 'volatile-highlights)
  (volatile-highlights-mode t)
  :diminish volatile-highlights-mode)

(provide 'init-visuals)
