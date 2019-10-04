;(setq elpy-rpc-python-command "python")


(add-hook 'elpy-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 '((company-dabbrev-code company-yasnippet elpy-company-backend comply-jedi)))))
