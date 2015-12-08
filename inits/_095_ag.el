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
