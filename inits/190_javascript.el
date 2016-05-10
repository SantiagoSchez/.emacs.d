;; Better JavaScript mode
;; https://github.com/mooz/js2-mode
(use-package js2-mode
  :ensure t
  :config
  (setq-default js2-mode-show-parse-errors nil
                js2-strict-missing-semi-warning nil
                js2-strict-trailing-comma-warning nil
                js2-global-externs '("module"
                                     "require"
                                     "buster"
                                     "sinon"
                                     "assert"
                                     "refute"
                                     "setTimeout"
                                     "clearTimeout"
                                     "setInterval"
                                     "clearInterval"
                                     "location"
                                     "__dirname"
                                     "console"
                                     "JSON"
                                     "window"
                                     "$"
                                     "jQuery"))
  (add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
  (add-hook 'js-mode-hook 'js2-minor-mode)
  (setq js2-highlight-level 3))

;; Emacs ternjs integration (autocompletion and more)
;; https://github.com/marijnh/tern
(use-package tern
  :ensure t
  :config
  (setq tern-command '("tern"))
  (add-hook 'js2-minor-mode-hook 'tern-mode)
  (defun delete-tern-process ()
    (interactive)
    (delete-process "Tern")))

;; Allows to create and edit the .tern-project file with Emacs GUI quickly
;; M-x tern-prj-dialog
;; https://github.com/kiwanami/emacs-tern-project-dialog
(use-package tern-project-dialog
  :ensure tern
  :ensure widget-mvc)

;; Company bindings for tern
;; https://github.com/proofit404/company-tern
(use-package company-tern
  :ensure t
  :ensure company
  :config (add-to-list 'company-backends 'company-tern))
