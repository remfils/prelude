;;; package --- Summary
;;; Commentary:
;;; Code:

(global-set-key (kbd "C-c c") 'org-capture)

(setq org-directory "~/.org")

(setq org-default-notes-file (concat org-directory "/notes.org"))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline (concat org-directory "/t.org") "Tasks")
         "* TODO %?\n %T\n %a")
        ("w" "Todo work" entry (file+headline (concat org-directory "/t.org") "Work")
         "* TODO %?\n %T\n %a")
        ("j" "Journal" entry (file+datetree (concat org-directory "/j.org"))
         "* %T\n%?")
        ("l" "Local journal" entry (file+datetree (concat org-directory "/local-j.org"))
         "* %T\n%?")))

(org-babel-do-load-languages
 'org-babel-load-languages '((sh . t) (python . t) (perl . t)))


(defun remfils/commit-and-push-org-changes()
  "This function updates repo at org-directory and pushes new changes"
  (interactive)
  (shell-command (concat "cd " org-directory " && git stash && git pull && git stash pop && git commit -am '++' && git push")))

;;; remfils-org-mode.el ends here
