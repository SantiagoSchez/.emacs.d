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
        projectile-indexing-method 'alien
        helm-split-window-in-side-p t)
  (helm-projectile-on))
