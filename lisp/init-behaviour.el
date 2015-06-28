;; Base config
(use-package init-behaviour-base
  :init (provide 'init-behaviour-base)
  :config
  (setq before-save-hook '(whitespace-cleanup)
	auto-save-default nil
	make-backup-files nil
	mouse-wheel-progressive-speed nil
	mouse-wheel-scroll-amount '(3 ((shift) . 1) ((control)))
	scroll-conservatively 101
	text-mode-hook '(turn-on-flyspell text-mode-hook-identify visual-line-mode)
	load-prefer-newer t)
  (fset 'yes-or-no-p 'y-or-n-p)
  (global-auto-revert-mode 1))

(provide 'init-behaviour)
