(use-package visual-regexp-steroids
  :ensure t
  :ensure visual-regexp
  :disabled t
  :bind (("M-5" . vr/replace)
         ("M-%" . vr/query-replace)
         ("C-r" . vr/isearch-backward)
         ("C-s" . vr/isearch-forward)))
