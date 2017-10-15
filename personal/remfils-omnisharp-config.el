(if (equal system-type 'windows-nt)
    (setq omnisharp-server-executable-path "~/.emacs.d/.omnisharp/run.bat")
  (setq omnisharp-server-executable-path "~/.emacs.d/.omnisharp/run"))

(defun remfils/omnisharp-hook nil
  (setq
   ;; never start auto-completion unless I ask for it
   company-idle-delay 0.1
   ;; autocomplete right after '.'
   company-minimum-prefix-length 0
   ;; remove echo delay
   company-echo-delay 0)
  )

;(omnisharp-add-style)

;; (add-hook 'omnisharp-mode-hook
;;           (lambda nil
;;             ()))

(provide 'remfils-omnisharp-config)
