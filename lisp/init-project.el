;; Projectile project management
;; https://github.com/bbatsov/projectile
(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  (setq projectile-keymap-prefix (kbd "C-c p")
        projectile-enable-caching t)
  (add-hook 'prog-mode-hook 'projectile-global-mode))

;; Helm integration with Projectile
(use-package helm-projectile
  :ensure t
  :bind (("C-c C-f" . helm-projectile-find-file))
  :config
  (setq projectile-completion-system 'helm
        projectile-indexing-method 'alien)
  (helm-projectile-on))

;; Grep-like tool but faster
;; https://github.com/Wilfred/ag.el
(use-package ag
  :ensure t
  :ensure wgrep
  :ensure wgrep-ag
  :config
  (bind-keys :map ag-mode-map
             ("q" . kill-this-buffer))
  (setq ag-highlight-search t))

;; Speedbar in the own frame
;; http://www.emacswiki.org/emacs/SrSpeedbar
(use-package sr-speedbar
  :ensure t
  :bind (("<f8>" . sr-speedbar-toggle))
  :config
  (setq sr-speedbar-right-side nil
        sr-speedbar-max-width 10
        sr-speedbar-default-width 20
        speedbar-show-unknown-files t)
  (defadvice sr-speedbar-open (before open-sr-speedbar-no-golden-ratio activate)
    (golden-ratio-mode -1))
  (defadvice sr-speedbar-open (after open-sr-speedbar-const-width activate)
    (with-current-buffer sr-speedbar-buffer-name
      (setq window-size-fixed 'width)))
  (defadvice sr-speedbar-close (after close-sr-speedbar-golden-ratio activate)
    (golden-ratio-mode 1)))

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

(provide 'init-project)
