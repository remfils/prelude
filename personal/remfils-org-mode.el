;;; package --- Summary
;;; Commentary:
;;; Code:

(defun remfils/org-mode-hook ()
  (define-key org-mode-map (kbd "C-c SPC") nil))

(add-hook 'org-mode-hook 'remfils/org-mode-hook)



;;; remfils-org-mode.el ends here
