;; company-mode completion back-end for Python JEDI
;; https://github.com/syohex/emacs-company-jedi
(use-package company-jedi
  :ensure t
  :init
  (setq jedi:tooltip-method nil
        jedi:complete-on-dot t)
  (add-hook 'view-mode-hook (lambda () (flyspell-mode -1)))
  (defun my/python-mode-hook ()
    (add-to-list 'company-backends 'company-jedi)
    (jedi:setup))
  (add-hook 'python-mode-hook 'my/python-mode-hook))
