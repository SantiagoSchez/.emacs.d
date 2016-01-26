;; Customizations for shell-script-mode
(use-package shell-script-mode
  :defer t
  :mode (("\\.zsh$" . shell-script-mode)
         ("\\.sh$" . shell-script-mode))
  :init
  (setq sh-basic-offset 2
        sh-indentation 2))
