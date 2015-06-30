;; Base config
(use-package init-visuals-base
  :init (provide 'init-visuals-base)
  :config
  (setq column-number-mode t
        default-frame-alist '((font . "Meslo LG S DZ-10"))
        echo-keystrokes 0.25
        global-hl-line-sticky-flag t
        inhibit-startup-screen t
        make-cursor-line-fully-visible nil
        frame-title-format '(buffer-file-name "%f" ("%b")))
  (tool-bar-mode -1)
  (set-default 'cursor-type 'bar)
  (set-frame-font "Meslo LG S DZ-10")
  (global-hl-line-mode)
  (show-paren-mode)
  (defun light ()
    "Activate a light color theme."
    (interactive)
    (load-theme 'solarized-light t))
  (defun dark ()
    "Activate a dark color theme."
    (interactive)
    (load-theme 'solarized-dark t)))

;; The Solarized light/dark themes
;; https://github.com/bbatsov/solarized-emacs
(use-package solarized-theme
  :ensure t
  :config
  (setq x-underline-at-descent-line t)
  (if (display-graphic-p)
      (load-theme 'solarized-light t)
    (load-theme 'solarized-dark t)))

;; Improves the mode line by showing and reorganising the displayed information
;; Also it works nice with solarized theme
;; https://github.com/Malabarba/smart-mode-line/
(use-package smart-mode-line
  :ensure t
  :init
  (setq sml/no-confirm-load-theme t
        sml/theme 'automatic)
  (sml/setup))

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

;; Change theme by day or night-theme
;; https://github.com/hadronzoo/theme-changer
(use-package theme-changer
  :ensure t
  :init
  (setq calendar-location-name "Spain"
        calendar-latitude 38.98
        calendar-longitude -3.92)
  :config
  (change-theme 'solarized-light 'solarized-dark))

;; More efficient line numbering
;; http://elpa.gnu.org/packages/nlinum.html
(use-package nlinum
  :ensure t
  :config
  (setq nlinum-format "%4d \u2502 ")
  (add-hook 'prog-mode-hook 'nlinum-mode))

(provide 'init-visuals)
