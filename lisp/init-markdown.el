;; Provides some useful utilities when editing markdown files
;; http://jblevins.org/projects/markdown-mode/
(use-package markdown-mode
  :ensure t
  :mode (("\\.text$" . markdown-mode)
         ("\\.markdown$" . markdown-mode)
         ("\\.md$" . markdown-mode)))

(provide 'init-markdown)
