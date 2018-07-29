;;; package --- summary
;;; Commentary:
;;;

;;; Code:

;;; auto mode

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.cshtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.twig\\'" . web-mode))

(add-hook 'css-mode-hook 'emmet-mode)

;;; basic configs

(defun remfils/php-mode-config-hook()
  (ggtags-mode 1))

(add-hook 'web-mode-hook 'remfils/php-mode-config-hook)

;; web mode

;;; select attribute text

(defun remfils/web-mode-content-select()
  (interactive)
  (web-mode-attribute-beginning)
  (skip-chars-forward "a-zA-Z=")
  (forward-char 1)
                                        ;(push-mark)
  (set-mark-command nil)
  (skip-chars-forward "a-zA-Z0-9 _-:\/{}()")
  (setq deactivate-mark nil))

(defun remfils/web-mode-config-hook ()
  "Set whitespace to 2 spaces and enable some modes."
  (emmet-mode)

  (setq web-mode-enable-current-element-highlight t)

  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)

  (define-key web-mode-map (kbd "C-c C-s") 'helm-swoop)
  (define-key web-mode-map (kbd "C-c C-a a") 'remfils/web-mode-content-select)
  

  (ggtags-mode 1))

(add-hook 'web-mode-hook 'remfils/web-mode-config-hook)

;;;; css-mode
(defun remfils/css-mode-config-hook ()
  (electric-pair-mode)
  (setq css-electric-brace-behavior 1)
  (setq css-indent-offset 2)
  
  (rainbow-mode))

(add-hook 'css-mode-hook 'remfils/css-mode-config-hook)

;;;; js-mode
(defun remfils/js-mode-config-hook()
  (setq js-indent-level 2)
  (setq-default js2-basic-offset 2)
  (ac-js2-mode))

(add-hook 'js-mode-hook 'remfils/js-mode-config-hook)

;;; hotkeys


(defun remfils/lsp-php-enable()
  (require 'lsp-php)
  (when (equal system-type 'windows-nt)
    (setq lsp-php-language-server-command '("php-language-server.php.bat")))
  (lsp-define-tcp-client lsp-tcp-php "php"
                         'lsp-php-get-root
                         (lsp-php-get-language-server-command)
                         "127.0.0.1"
                         49621
                         :ignore-regexps (lsp-php-get-ignore-regexps))
  (lsp-php-enable))

(provide 'remfils-web-dev)
;;; remfils-web-dev.el ends here
