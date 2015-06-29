;; Begin init.el -- Main entry point to Emacs configuration

(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'init-package-management)
(require 'init-behaviour)
(require 'init-visuals)
(require 'init-text-edition)
(require 'init-search)
(require 'init-project)
(require 'init-file-management)
(require 'init-windows)
(require 'init-ido)
(require 'init-prog)
(require 'init-flycheck)
(require 'init-python)
(require 'init-javascript)
(require 'init-markdown)

;; End init.el
