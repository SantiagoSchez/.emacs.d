;; Begin init.el -- Main entry point to Emacs configuration

(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'init-package-management)
(require 'init-behaviour)
(require 'init-visuals)
(require 'init-text-edition)
(require 'init-search)
(require 'init-windows)
(require 'init-ido)
(require 'init-project)
(require 'init-prog)
(require 'init-flycheck)
(require 'init-python)
(require 'init-javascript)
(require 'init-markdown)

;; End init.el
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
