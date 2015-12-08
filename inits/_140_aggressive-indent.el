;; Better indentation by keeping track of code blocks
;; https://github.com/Malabarba/aggressive-indent-mode
(use-package aggressive-indent
  :ensure t
  :diminish aggressive-indent-mode
  :init
  (global-aggressive-indent-mode 1)
  (add-to-list 'aggressive-indent-excluded-modes 'html-mode)
  (unbind-key "C-c C-q" aggressive-indent-mode-map))
