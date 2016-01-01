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

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

