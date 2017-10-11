(if (equal system-type 'windows-nt)
    (setq omnisharp-server-executable-path "~/.emacs.d/.omnisharp/run.bat")
  (setq omnisharp-server-executable-path "~/.emacs.d/.omnisharp/run"))

(provide 'remfils-omnisharp-config)
