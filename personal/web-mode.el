;;; package --- Summary
;;; Commentary:
;;; Code

(defun my-web-mode-hook ()
  "Hook for a web-mode"
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent 2)
  (setq web-mode-code-indent-offset 2))

(add-hook 'web-mode-hook 'my-web-mode-hook)

(provide 'web-mode)
;;; web-mode.el ends here
