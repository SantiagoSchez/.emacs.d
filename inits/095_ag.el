;; Grep-like tool but faster
;; Requires silversearcher-ag
;; https://github.com/Wilfred/ag.el
(use-package ag
  :ensure t
  :config
  (bind-keys :prefix-map ag-global-prefix-map
               :prefix "C-x g"
               ("g" . ag)
               ("a" . ag)
               ("d" . ag-dired)
               ("R" . ag-dired-regexp)
               ("r" . ag-regexp)
               ("k" . ag-kill-buffers))
  (setq ag-highlight-search t))
