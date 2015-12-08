;; Allows to move and duplicate lines
;; https://github.com/wyuenho/move-dup
(use-package move-dup
  :ensure t
  :bind (("M-<up>" . md/move-lines-up)
         ("M-<down>" . md/move-lines-down)
         ("M-S-<up>" . md/duplicate-up)
         ("M-S-<down>" . md/duplicate-down)))
