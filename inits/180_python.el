(with-eval-after-load 'python
  (define-key python-mode-map (kbd "<tab>") 'python-indent-shift-right)
  (define-key python-mode-map (kbd "<backtab>") 'python-indent-shift-left))
