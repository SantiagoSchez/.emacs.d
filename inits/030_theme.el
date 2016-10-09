;; https://github.com/hlissner/emacs-doom-theme
;; Doom theme and neotree icons
;; Once icons are installed, their fonts:
;; (https://github.com/domtronn/all-the-icons.el/tree/master/fonts)
;; must be installed to system fonts and then:
;; $ sudo fc-cache -f -v
(use-package doom-themes
  :ensure all-the-icons
  :ensure t
  :init
  (load-theme 'doom-one t)
  (require 'doom-neotree)
  :config
  (add-hook 'find-file-hook 'doom-buffer-mode)
  (add-hook 'minibuffer-setup-hook 'doom-brighten-minibuffer)
  (setq org-fontify-whole-heading-line t
        org-fontify-done-headline t
        org-fontify-quote-and-verse-blocks t
        doom-neotree-enable-file-icons t
        doom-neotree-file-icons t))
