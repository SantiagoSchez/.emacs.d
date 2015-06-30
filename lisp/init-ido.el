;; Base config
(use-package init-ido-base
  :init (provide 'init-ido-base)
  :config
  (setq ido-enable-dot-prefix t
        ido-enable-flex-matching t
        ido-everywhere t)
  (ido-mode t))

;; Using fuzzy matching with IDO
;; https://github.com/lewang/flx
(use-package flx-ido
  :ensure t
  :init (flx-ido-mode 1)
  :config
  (setq flx-ido-threshold 1000
        ido-use-faces nil))

;; Sets IDO mode to vertical instead horizontal
;; https://github.com/creichert/ido-vertical-mode.el
(use-package ido-vertical-mode
  :ensure t
  :init (ido-vertical-mode)
  :config (setq ido-vertical-define-keys 'C-n-C-p-up-down))

;; Allows to use IDO wherever it is possible in Emacs
;; https://github.com/DarwinAwardWinner/ido-ubiquitous
(use-package ido-ubiquitous
  :ensure t
  :init (ido-ubiquitous-mode 1))

;; Uses IDO with execute-extended-command
;; https://github.com/nonsequitur/smex
(use-package smex
  :defer t
  :ensure t
  :init (smex-initialize)
  :bind (("M-x" . smex)
         ("M-X" . smex-major-mode-commands)))

(provide 'init-ido)
