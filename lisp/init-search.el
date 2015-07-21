;; Base config
(use-package init-search-base
  :init (provide 'init-search-base)
  :config
  (setq apropos-do-all t
        apropos-sort-by-scores t))

;; Allows to use regexp visually on isearch
;; https://github.com/benma/visual-regexp-steroids.el/
(use-package visual-regexp-steroids
  :ensure t
  :ensure visual-regexp
  :disabled t
  :bind (("M-5" . vr/replace)
         ("M-%" . vr/query-replace)
         ("C-r" . vr/isearch-backward)
         ("C-s" . vr/isearch-forward)))

;; Mode to help you to move the cursor within Emacs
;; https://github.com/winterTTr/ace-jump-mode
(use-package ace-jump-mode
  :ensure t
  :bind (("C-c SPC" . ace-jump-mode)))

(provide 'init-search)
