;; Vitamined dired mode
(use-package dired
  :ensure dired+
  :init
  (use-package dired-x)
  :config
  (defun my/dired-linux-open ()
    "Use the `xdg-open' command to open a file with the correct application"
    (interactive)
    (save-window-excursion
      (dired-do-async-shell-command
       "xdg-open" current-prefix-arg
       (dired-get-marked-files t current-prefix-arg))))
  (put 'dired-find-alternate-file 'disabled nil)
  (setq ls-lisp-dirs-first t
        dired-recursive-copies 'always
        dired-recursive-deletes 'top
        dired-dwim-target t
        dired-ls-F-marks-symlinks t
        delete-by-moving-to-trash t)
  (dired-omit-mode 1)
  (global-auto-revert-mode 1)
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
  (define-key dired-mode-map (kbd "C-M-u") 'dired-up-directory)
  (define-key dired-mode-map (kbd "M-o") #'my/dired-linux-open)
  (define-key dired-mode-map (kbd "C-x C-q") 'wdired-change-to-wdired-mode))
