;; Improves the mode line by showing and reorganising the displayed information
;; Also it works nice with solarized theme
;; https://github.com/Malabarba/smart-mode-line/
(use-package smart-mode-line
  :ensure t
  :init
  (setq sml/no-confirm-load-theme t
        sml/theme 'respectful)
  (sml/setup))
