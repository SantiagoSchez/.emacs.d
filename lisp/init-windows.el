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
  :defer t
  :diminish golden-ratio-mode
  :init (golden-ratio-mode 1)
  :config
  (setq golden-ratio-auto-scale t
        golden-ratio-exclude-buffer-names '("*helm projectile*"
                                            "*SPEEDBAR*"
                                            " *NeoTree*")
        golden-ratio-exclude-modes '("ediff-mode"
                                     "gud-mode"
                                     "gdb-locals-mode"
                                     "gdb-registers-mode"
                                     "gdb-breakpoints-mode"
                                     "gdb-threads-mode"
                                     "gdb-frames-mode"
                                     "gdb-inferior-io-mode"
                                     "gud-mode"
                                     "gdb-inferior-io-mode"
                                     "gdb-disassembly-mode"
                                     "gdb-memory-mode"
                                     "magit-log-mode"
                                     "magit-reflog-mode"
                                     "magit-status-mode"
                                     "IELM"
                                     "eshell-mode"
                                     "neotree-mode"
                                     "dired-mode"
                                     "pdf-outline-buffer-mode"
                                     "speedbar-mode")))

(provide 'init-windows)
