;; Mode for keeping notes, maintaining TODO lists, planning projects,
;; and authoring documents with a fast and effective plain-text
;; system.
;; http://orgmode.org/
(use-package org
  :ensure t
  :mode ("\\.org\\'" . org-mode)
  :init
  (setq user-full-name "Santiago Sánchez Sobrino"
        user-mail-address "sanchezsobrino@gmail.com"
        org-directory "~/Copy/Documentos/org"
        org-default-notes-file "~/Copy/Documentos/org/notes.org"))
