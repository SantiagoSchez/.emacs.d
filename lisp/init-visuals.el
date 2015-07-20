;; Base config
(use-package init-visuals-base
  :init (provide 'init-visuals-base)
  :config
  (setq my/font "Source Code Pro-10"
        column-number-mode t
        echo-keystrokes 0.25
        global-hl-line-sticky-flag t
        inhibit-startup-screen t
        make-cursor-line-fully-visible nil
        frame-title-format '(buffer-file-name "%f" ("%b")))
  (tool-bar-mode -1)
  (set-default 'cursor-type 'bar)
  (set-frame-font my/font)
  (global-hl-line-mode)
  (show-paren-mode)
  (defun swap-day-night-theme ()
    "Switch between day/night themes."
    (interactive)
    (if (eq (frame-parameter (next-frame) 'background-mode) 'dark)
        (load-theme day-theme t)
      (load-theme night-theme t))))

;; The Solarized light/dark themes
;; https://github.com/bbatsov/solarized-emacs
(use-package solarized-theme
  :ensure t
  :disabled t
  :init
  (setq day-theme 'solarized-light
        night-theme 'solarized-dark
        x-underline-at-descent-line t)
  (if (display-graphic-p)
      (load-theme night-theme t)
    (load-theme day-theme t)))

;; Tomorrow night themes
;; https://github.com/purcell/color-theme-sanityinc-tomorrow
(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :init
  (setq day-theme 'sanityinc-tomorrow-day
        night-theme 'sanityinc-tomorrow-eighties)
  (if (display-graphic-p)
      (load-theme night-theme t)
    (load-theme day-theme t))
  :config
  (defun apply-custom-faces ()
    (set-face-background 'fringe (face-attribute 'default :background) nil)
    (set-face-background 'linum (face-attribute 'default :background) nil))
  (add-hook 'after-init-hook 'apply-custom-faces)
  (defadvice swap-day-night-theme (after swap-day-night-theme-after activate)
    (apply-custom-faces)))

;; Improves the mode line by showing and reorganising the displayed information
;; Also it works nice with solarized theme
;; https://github.com/Malabarba/smart-mode-line/
(use-package smart-mode-line
  :ensure t
  :init
  (setq sml/no-confirm-load-theme t
        sml/theme 'respectful)
  (sml/setup))

;; Colorful parens, brackets, curly braces, etc. by level
;; https://github.com/Fanael/rainbow-delimiters
(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  :config
  (setq rainbow-delimiters-max-face-count 1)
  (set-face-attribute 'rainbow-delimiters-unmatched-face nil
                      :foreground 'unspecified
                      :inherit 'error))

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
  (change-theme day-theme night-theme))

;; More efficient line numbering
;; http://elpa.gnu.org/packages/nlinum.html
(use-package nlinum
  :ensure t
  :config
  (setq nlinum-format "%4d \u2502 "))

;; Displays tildes on empty lines at the end of file
;; https://github.com/jmickelin/vim-empty-lines-mode
(use-package vim-empty-lines-mode
  :ensure t
  :init
  (global-vim-empty-lines-mode))

(provide 'init-visuals)
