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
