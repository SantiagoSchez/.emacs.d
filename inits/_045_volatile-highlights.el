;; Highlight changes and other things visually
;; https://github.com/k-talo/volatile-highlights.el
(use-package volatile-highlights
  :defer t
  :ensure t
  :init
  (require 'volatile-highlights)
  (volatile-highlights-mode t)
  :diminish volatile-highlights-mode)
