;;; package --- Summary
;;; Commentary:
;;; Code:

(global-linum-mode 1)
(setq linum-format " %3d")

;; For number
(set-face-attribute 'linum nil :height 100)
(setq visible-bell 1)

(require 'yasnippet)
(yas-global-mode 1)

(electric-pair-mode 1)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(scroll-bar-mode -1)

;; autosave mode off
(setq auto-save-default nil)
(setq create-lockfiles nil)

; stop creating backup~ files
(setq make-backup-files nil)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq gnus-dribble-directory
      `((".*" ,temporary-file-directory t)))

;; theme
;; (disable-theme 'zenburn)
;; (load-theme 'material t)

(setq neo-theme 'icons)

;; projectile settings

(add-to-list 'projectile-globally-ignored-directories "node_modules")
(add-to-list 'projectile-globally-ignored-directories "vendor")

(provide 'remfils-settings)
;;; remfils-settings.el ends here
