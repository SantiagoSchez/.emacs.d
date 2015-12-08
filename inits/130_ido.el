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
  :config (setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right))

;; Allows to use IDO wherever it is possible in Emacs
;; https://github.com/DarwinAwardWinner/ido-ubiquitous
(use-package ido-ubiquitous
  :ensure t
  :init (ido-ubiquitous-mode 1))
