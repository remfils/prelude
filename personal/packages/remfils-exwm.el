;; usefull sources:
;; - https://wiki.archlinux.org/index.php/EXWM
;; - https://github.com/ch11ng/exwm/wiki

;; to load settings use
;;;; (load-file "~/.emacs.d/personal/packages/remfils-exwm.el")

(require 'exwm)
(require 'helm-exwm)
(require 'exwm-config)
(exwm-config-default)

(require 'exwm-systemtray)
(exwm-systemtray-enable)

(exwm-input-set-key (kbd "s-&")
                    (lambda (command)
                      (interactive (list (read-shell-command "$ ")))
                      (start-process-shell-command command nil command)))

