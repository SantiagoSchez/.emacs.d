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
