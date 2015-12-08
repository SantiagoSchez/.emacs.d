;; -----------------------------------------------------------------------------
;; Init file.
;; Do not touch; just go to inits/ directory and mess there.
;; -----------------------------------------------------------------------------

(package-initialize)

(add-to-list 'load-path "~/.emacs.d/externals")

;; Add melpa repository and install use-package if not found
;; http://melpa.org
;; https://github.com/jwiegley/use-package
(unless (assoc-default "melpa" package-archives)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;; Load .el files in the specified directory following a numeric order.
;; http://melpa.org/#/init-loader
(use-package init-loader
  :ensure t
  :config
  (setq init-loader-show-log-after-init "error-only")
  (init-loader-load "~/.emacs.d/inits"))

;; AUTO REGION INSERTED BY EMACS -----------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (popup ag nlinum init-loader web-mode volatile-highlights vim-empty-lines-mode use-package undo-tree theme-changer syntax-subword sr-speedbar smex smart-mode-line rainbow-delimiters projectile-speedbar paradox multiple-cursors move-dup markdown-mode magit js2-mode ido-vertical-mode ido-ubiquitous helm-projectile golden-ratio flycheck-pos-tip flx-ido dired+ company-tern company-anaconda color-theme-sanityinc-tomorrow aggressive-indent ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
