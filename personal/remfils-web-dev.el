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

(add-hook
 'web-mode-hook
 (lambda ()
   (progn
     (emmet-mode)

     (setq web-mode-enable-current-element-highlight t)

     (setq web-mode-markup-indent-offset 2)
     (setq web-mode-css-indent-offset 2)
     (setq web-mode-code-indent-offset 2))))

;;;; css-mode
(add-hook
 'css-mode-hook
 (lambda ()
   (progn
     (electric-pair-mode)
     (setq css-electric-brace-behavior 1)
     (setq css-indent-offset 2))))


;;;; js-mode

(setq js-indent-level 2)
(setq-default js2-basic-offset 2)

;;; hotkeys


(provide 'remfils-web-dev)
;;; remfils-web-dev.el ends here
