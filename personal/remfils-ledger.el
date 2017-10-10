(add-to-list 'auto-mode-alist '("\\.sm\\'" . ledger-mode))

(defun remfils/ledger__insert-ruble-sign ()
  (interactive)
  ;; (insert "₽") ; more progressive ruble display
  (insert "RUB"))

(defun remfils/ledger-mode-hook ()
  (local-set-key (kbd "C-$") #'remfils/ledger__insert-ruble-sign))

(add-hook 'ledger-mode-hook 'remfils/ledger-mode-hook)

(provide 'remfils-ledger)
