;; usefull sources:
;; - https://wiki.archlinux.org/index.php/EXWM
;; - https://github.com/ch11ng/exwm/wiki

;; to load settings use
;;;; (load-file "~/.emacs.d/personal/packages/remfils-exwm.el")

(require 'exwm)
(require 'helm-exwm)
(require 'exwm-config)

(require 'exwm-systemtray)
(exwm-systemtray-enable)

(exwm-config-default)

(exwm-input-set-simulation-keys
 '(
   ;; movement
   ([?\C-b] . left)
   ([?\M-b] . C-left)
   ([?\C-f] . right)
   ([?\M-f] . C-right)
   ([?\C-p] . up)
   ([?\C-n] . down)
   ([?\C-a] . home)
   ([?\C-e] . end)
   ([?\M-v] . prior)
   ([?\C-v] . next)
   ([?\C-d] . delete)
   ([?\C-k] . (S-end delete))
   ;; cut/paste.
   ([?\C-w] . ?\C-x)
   ([?\M-w] . ?\C-c)
   ([?\C-y] . ?\C-v)
   ;; search
   ([?\C-s] . ?\C-f)))

(exwm-input-set-key (kbd "s-&")
                    (lambda (command)
                      (interactive (list (read-shell-command "$ ")))
                      (start-process-shell-command command nil command)))
