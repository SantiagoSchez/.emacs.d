(use-package init-windows-base
  :init (provide 'init-windows-base)
  :config (windmove-default-keybindings))

;; Provides undo/redo for windows layout
;; http://www.emacswiki.org/emacs/WinnerMode
(use-package winner
  :init (winner-mode))

;; Fix windows size on focus
;; https://github.com/roman/golden-ratio.el
(use-package golden-ratio
  :ensure t
  :diminish golden-ratio-mode
  :init (golden-ratio-mode 1)
  :config
  (setq golden-ratio-auto-scale t
	golden-ratio-exclude-buffer-names '(" *NeoTree*")))

(provide 'init-windows)
