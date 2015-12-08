;; Syntax checking on-the-fly
;; https://github.com/flycheck/flycheck
(use-package flycheck
  :ensure t
  :init (setq flycheck-completion-system 'ido)
  :config
  (add-hook 'python-mode-hook 'flycheck-mode)
  (add-hook 'js2-minor-mode-hook 'flycheck-mode))

;; Show errors and warnings at point position and not in minibuffer
;; https://github.com/flycheck/flycheck-pos-tip
(use-package flycheck-pos-tip
  :ensure t
  :init
  (setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages))
