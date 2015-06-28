;; Projectile project management
;; https://github.com/bbatsov/projectile
(use-package projectile
  :defer t
  :ensure t
  :diminish projectile-mode
  :config
  (setq projectile-keymap-prefix (kbd "C-c p")
	projectile-enable-caching t)
  (add-hook 'prog-mode-hook 'projectile-global-mode))

;; Helm integration with Projectile
(use-package helm-projectile
  :ensure t
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

;; An Emacs tree plugin like NerdTree for Vim
;; https://github.com/jaypei/emacs-neotree
(use-package neotree
  :ensure t
  :bind (("<f8>" . neotree-toggle))
  :config
  (setq projectile-switch-project-action 'neotree-projectile-action
	neo-theme 'ascii))

(provide 'init-project)
