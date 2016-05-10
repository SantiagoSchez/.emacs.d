;; More efficient line numbering
;; http://elpa.gnu.org/packages/nlinum.html
(use-package nlinum
  :ensure t
  :config
  (setq nlinum-format "%4d ")
  (global-nlinum-mode))
