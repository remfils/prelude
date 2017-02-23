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

;; autosave mode off
(setq auto-save-default nil)

(provide 'remfils-settings)
;;; remfils-settings.el ends here
