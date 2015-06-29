;; Base config
(use-package init-text-edition-base
  :init (provide 'init-text-edition-base)
  :config
  (set-fill-column 79)
  (delete-selection-mode)
  (setq-default indent-tabs-mode nil))

;; Allows to move and duplicate lines
;; https://github.com/wyuenho/move-dup
(use-package move-dup
  :ensure t
  :bind (("M-<up>" . md/move-lines-up)
	 ("M-<down>" . md/move-lines-down)
	 ("M-S-<up>" . md/duplicate-up)
	 ("M-S-<down>" . md/duplicate-down)))

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

;; Multiple cursors, what else?
;; https://github.com/magnars/multiple-cursors.el
(use-package multiple-cursors
  :ensure t
  :bind (("C->" . mc/mark-next-like-this)
	 ("C-<" . mc/mark-previous-like-this)
	 ("C-*" . mc/mark-all-like-this)))

;; Better point movement by subwords
;; http://www.bytebucket.org/jpkotta/syntax-subword
(use-package syntax-subword
  :ensure t
  :init (global-syntax-subword-mode)
  :config
  (defun forward-delete-word (arg)
    "Delete instead kill a word forward"
    (interactive "p")
    (delete-region (point) (progn (syntax-subword-forward arg) (point))))
  (defun backward-delete-word (arg)
    "Delete instead kill a word backward"
    (interactive "p")
    (delete-region (point) (progn (syntax-subword-backward arg) (point))))
  :bind (("C-<delete>" . forward-delete-word)
	 ("C-<backspace>" . backward-delete-word)))

;; Join lines
(use-package join-lines
  :init
  (defun top-join-line ()
    "Join the current line with the line beneath it."
    (interactive)
    (delete-indentation 1))
  :bind ("M-j" . top-join-line))

(provide 'init-text-edition)
