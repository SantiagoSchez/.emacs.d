;; Join lines
(use-package join-lines
  :init
  (defun top-join-line ()
    "Join the current line with the line beneath it."
    (interactive)
    (delete-indentation 1))
  :bind ("M-j" . top-join-line))
