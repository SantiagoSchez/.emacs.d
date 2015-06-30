;; Add melpa repository and install use-package if not found
;; http://melpa.org
;; https://github.com/jwiegley/use-package
(package-initialize)
(unless (assoc-default "melpa" package-archives)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;; Better package manager with ratios and cool stuff
;; https://github.com/Malabarba/paradox
(use-package paradox
  :ensure t
  :init
  (setq paradox-github-token t
        paradox-column-width-package 30))

(provide 'init-package-management)
