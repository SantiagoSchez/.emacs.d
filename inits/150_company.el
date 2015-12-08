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
