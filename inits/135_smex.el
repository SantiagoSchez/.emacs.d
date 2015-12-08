;; Uses IDO with execute-extended-command
;; https://github.com/nonsequitur/smex
(use-package smex
  :defer t
  :ensure t
  :init (smex-initialize)
  :bind (("M-x" . smex)
         ("M-X" . smex-major-mode-commands)))
