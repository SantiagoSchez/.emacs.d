;; Automatic insertion, wrapping and paredit-like navigation with user defined pairs
;; https://github.com/Fuco1/smartparens
(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :init
  (require 'smartparens-config)
  (show-smartparens-global-mode t)
  (smartparens-global-mode t)
  (add-hook 'prog-mode-hook 'turn-on-smartparens-mode)
  (sp-pair "\"" "\"" :actions '(wrap))
  (sp-pair "'" "'" :actions '(wrap)))
