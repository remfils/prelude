;;; package --- Summary
;;; Commentary:
;;; Code:

(global-set-key (kbd "C-c c") 'org-capture)

(setq org-directory "~/.org")

(setq org-default-notes-file (concat org-directory "/notes.org"))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline (concat org-directory "/t.org") "Общее")
         "* TODO %?\n %T\n %a")
        ("j" "Journal" entry (file+datetree (concat org-directory "/j.org"))
         "* %T\n%?")
        ("l" "Local journal" entry (file+datetree (concat org-directory "/local-j.org"))
         "* %T\n%?")))

(org-babel-do-load-languages
 'org-babel-load-languages '((sh . t) (python . t) (perl . t)))

(setq org-odt-category-map-alist
      '(("__Figure__" "Изображение" "value" "Изображение" org-odt--enumerable-image-p)))


(defun remfils/run-git-commands-on-repo (repo-dir commands)
  (let ((default-directory repo-dir)
        (git-commands (mapconcat (lambda (s) (concat "git " s)) commands " && ")))
      (magit-git-command git-commands)))

(defun remfils/commit-and-push-org-changes()
  "This function updates repo at org-directory and pushes new changes"
  (interactive)
  (remfils/run-git-commands-on-repo "~/.org" '("stash" "pull" "stash pop" "commit -am \"++\"" "push")))

;;; remfils-org-mode.el ends here
