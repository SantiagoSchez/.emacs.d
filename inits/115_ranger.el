;; Minor mode that runs within dired emulating many of the features of
;; ranger (http://ranger.nongnu.org/)
;; https://github.com/ralesi/ranger.el
(use-package ranger
  :ensure t
  :init
  (setq ranger-cleanup-on-disable t
        ranger-cleanup-eagerly t
        ranger-show-dotfiles t
        ranger-parent-depth 1
        ranger-show-literal nil
        ranger-width-preview 0.55
        ranger-excluded-extensions '("mkv" "iso" "mp4")
        ranger-max-preview-size 20
        ranger-dont-show-binary t
        ranger-hide-cursor nil)
  :bind ("<f10>" . ranger))
