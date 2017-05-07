;;; package --- Summary
;;; Commentary:
;;; Code:

(global-set-key (kbd "C-c c") 'org-capture)

(setq org-directory "~/.org")

(setq org-default-notes-file (concat org-directory "/notes.org"))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline (concat org-directory "/t.org") "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree (concat org-directory "/j.org"))
         "* %T\n%?")))
;;; remfils-org-mode.el ends here
