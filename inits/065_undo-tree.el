;; Provides an easier way to undo and redo
;; http://www.dr-qubit.org/emacs.php#undo-tree
(use-package undo-tree
  :ensure t
  :init (setq undo-tree-visualizer-relative-timestamps t
              undo-tree-visualizer-timestamps t)
  :config (global-undo-tree-mode t)
  :bind (("C-z" . undo-tree-undo)
         ("C-S-z" . undo-tree-redo))
  :diminish undo-tree-mode)
