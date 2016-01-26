;; Speedbar in the own frame
;; http://www.emacswiki.org/emacs/SrSpeedbar
(use-package sr-speedbar
  :ensure t
  :bind (("<f8>" . sr-speedbar-toggle))
  :config
  (setq sr-speedbar-right-side nil
        sr-speedbar-max-width 10
        sr-speedbar-default-width 20
        speedbar-show-unknown-files t))

;; Speedbar projectile integration
;; https://github.com/anshulverma/projectile-speedbar
(use-package projectile-speedbar
  :ensure t
  :bind (("M-<f8>" . projectile-speedbar-open-current-buffer-in-tree))
  :config
  (defadvice helm-projectile-find-file (after locate-file activate)
    (if (sr-speedbar-exist-p)
        (projectile-speedbar-open-current-buffer-in-tree)))
  (defadvice speedbar-item-load (after speedbar-highlight-file activate)
    (projectile-speedbar-open-current-buffer-in-tree)))
