;; A minor mode for Emacs that makes it possible to drag
;; stuff (words, region, lines) around in Emacs.
;; https://github.com/rejeep/drag-stuff.el
(use-package drag-stuff
  :ensure t
  :bind (("M-<up>" . drag-stuff-up)
         ("M-<down>" . drag-stuff-down)))
