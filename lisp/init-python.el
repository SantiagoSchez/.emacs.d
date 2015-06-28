;; Provides some useful utilities on python development
;; Requires pip packages: jedi service_factory
;; https://github.com/proofit404/anaconda-mode
(use-package anaconda-mode
  :ensure t
  :config
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'eldoc-mode))

;; Company bindings for anaconda
;; https://github.com/proofit404/company-anaconda
(use-package company-anaconda
  :ensure t
  :config
  (add-to-list 'company-backends 'company-anaconda))

(provide 'init-python)
