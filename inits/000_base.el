(setq before-save-hook '(whitespace-cleanup)
      auto-save-default nil
      make-backup-files nil
      mouse-wheel-progressive-speed nil
      mouse-wheel-scroll-amount '(3 ((shift) . 1) ((control)))
      scroll-conservatively 101
      scroll-margin 3
      text-mode-hook '(turn-on-flyspell
                       text-mode-hook-identify
                       visual-line-mode)
      load-prefer-newer t
      my/font "Source Code Pro-10"
      column-number-mode t
      echo-keystrokes 0.25
      global-hl-line-sticky-flag t
      inhibit-startup-screen t
      make-cursor-line-fully-visible nil
      frame-title-format '(buffer-file-name "%f" ("%b"))
      apropos-do-all t
      apropos-sort-by-scores t
      ido-enable-dot-prefix t
      ido-enable-flex-matching t
      ido-everywhere t)

(fset 'yes-or-no-p 'y-or-n-p)
(tool-bar-mode -1)
(set-default 'cursor-type 'bar)
(setq-default tab-width 4
              indent-tabs-mode nil)
(set-frame-font my/font)
(global-hl-line-mode)
(show-paren-mode)
(set-fill-column 79)
(delete-selection-mode)
(windmove-default-keybindings)
(ido-mode t)

(defun font-lock-comment-annotations ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|OPTIMIZE\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t))))
(add-hook 'prog-mode-hook 'font-lock-comment-annotations)
