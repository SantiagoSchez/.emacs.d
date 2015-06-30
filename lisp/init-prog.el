;; Base config
(use-package init-prog-base
  :init
  (defun font-lock-comment-annotations ()
    (font-lock-add-keywords
     nil '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|OPTIMIZE\\|HACK\\|REFACTOR\\):"
            1 font-lock-warning-face t))))
  (add-hook 'prog-mode-hook 'font-lock-comment-annotations))

;; Better indentation by keeping track of code blocks
;; https://github.com/Malabarba/aggressive-indent-mode
(use-package aggressive-indent
  :ensure t
  :diminish aggressive-indent-mode
  :init
  (global-aggressive-indent-mode 1)
  (add-to-list 'aggressive-indent-excluded-modes 'html-mode)
  (unbind-key "C-c C-q" aggressive-indent-mode-map))

;; Auto-completion engine
;; http://company-mode.github.io/
(use-package company
  :defer t
  :ensure t
  :init (add-hook 'prog-mode-hook 'company-mode)
  :config
  (setq company-idle-delay 0.2
        ;; min prefix of 2 chars
        company-minimum-prefix-length 2
        company-selection-wrap-around t
        company-show-numbers t
        company-dabbrev-downcase nil
        company-transformers '(company-sort-by-occurrence))
  (bind-keys :map company-active-map
             ("C-n" . company-select-next)
             ("C-p" . company-select-previous)
             ("C-d" . company-show-doc-buffer)
             ("<tab>" . company-complete))
  :bind ("C-." . company-complete))

(provide 'init-prog)
