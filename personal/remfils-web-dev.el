;;; package --- summary
;;; Commentary:
;;;

;;; Code:

;;; auto mode

(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

(add-hook 'css-mode-hook 'emmet-mode)

;;; basic configs

(defun remfils/web-mode-config-hook ()
  "Set whitespace to 2 spaces and enable some modes."
  (emmet-mode)

  (setq web-mode-enable-current-element-highlight t)

  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))

(add-hook 'web-mode-hook 'remfils/web-mode-config-hook)

;;;; css-mode
(defun remfils/css-mode-config-hook ()
  (electric-pair-mode)
  (setq css-electric-brace-behavior 1)
  (setq css-indent-offset 2))

(add-hook 'css-mode-hook 'remfils/css-mode-config-hook)

;;;; js-mode
(defun remfils/js-mode-config-hook()
  (setq js-indent-level 2)
  (setq-default js2-basic-offset 2))

(add-hook 'js-mode-hook 'remfils/js-mode-config-hook)

;;; hotkeys


(provide 'remfils-web-dev)
;;; remfils-web-dev.el ends here
