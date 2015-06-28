;; Better JavaScript mode
;; https://github.com/mooz/js2-mode
(use-package js2-mode
  :ensure t
  :mode (("\\.js$" . js2-mode)))

;; Emacs ternjs integration (autocompletion and more)
;; https://github.com/marijnh/tern
(use-package tern
  :ensure t
  :config
  (setq tern-command '("tern"))
  (add-hook 'js2-mode-hook 'tern-mode))

;; Company bindings for tern
;; https://github.com/proofit404/company-tern
(use-package company-tern
  :ensure t
  :config (add-to-list 'company-backends 'company-tern))

(provide 'init-javascript)
