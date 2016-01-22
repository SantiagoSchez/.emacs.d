(defun swap-day-night-theme ()
  "Switch between day/night themes."
  (interactive)
  (if (eq (frame-parameter (next-frame) 'background-mode) 'dark)
      (load-theme day-theme t)
    (load-theme night-theme t)))

;; Tomorrow night themes
;; https://github.com/purcell/color-theme-sanityinc-tomorrow
(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :init
  (setq day-theme 'sanityinc-tomorrow-day
        night-theme 'sanityinc-tomorrow-eighties)
  (load-theme night-theme t)
  :config
  (defun apply-custom-faces ()
    (set-face-background 'fringe (face-attribute 'default :background) nil)
                                        ;(set-face-background 'linum (face-attribute 'default :background) nil)
    )
  (add-hook 'after-init-hook 'apply-custom-faces)
  (defadvice swap-day-night-theme (after swap-day-night-theme-after activate)
    (apply-custom-faces)))

;; Change theme by day or night-theme
;; https://github.com/hadronzoo/theme-changer
(use-package theme-changer
  :ensure t
  :disabled t
  :init
  (setq calendar-location-name "Spain"
        calendar-latitude 38.98
        calendar-longitude -3.92)
  :config
  (change-theme day-theme night-theme))
