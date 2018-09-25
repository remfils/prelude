;;; package --- Summary
;;; Commentary:
;;; Code:

(setq org-file-apps
      '((auto-mode . emacs)
        ("\\.mm\\'" . default)
        ("\\.x?html?\\'" . default)
        ;; open links in okular
        ("\\.pdf\\'" . "application/pdf; okular %s")))


;; AGENDA

(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-agenda-files
      (list "documents/org/tasks.org"))

(setq cloud-path "/media/D/Downloads/YandexDisk/")
(when (equal system-type 'windows-nt)
  (setq cloud-path "d:/Downloads/YandexDisk/"))
(setq org-agenda-files (mapcar '(lambda (x) (concat cloud-path x)) org-agenda-files))

(setq org-agenda-files '("~/.org/t.org"))

;; CAPTURE

(global-set-key (kbd "C-c c") 'org-capture)

(setq org-directory "~/.org")

(setq org-default-notes-file (concat org-directory "/notes.org"))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline (concat org-directory "/t.org") "Общее")
         "* TODO %?\n %T\n %a")
        ("j" "Journal" entry (file+datetree (concat org-directory "/j.org"))
         "* %T\n%?")
        ("l" "Local journal" entry (file+datetree (concat org-directory "/local-j.org"))
         "* %T\n%?")
        ("c" "Code" entry (file+headline (concat org-directory "/code.org") "ОБЩЕЕ")
         "* %T\n%?")
        ("p" "Physics" entry (file+headline (concat org-directory "/phys.org") "МАТЕМАТИКА")
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



(defun remfils/group-lines-to-elisp-list ()
  "creates a elisp list of strings from lines in region"
  (interactive)
  (if (use-region-p)
      (let ((lines (split-string (buffer-substring (region-beginning) (region-end)) "\n")))
        (insert "\n(setq list-name '(")
        (mapcar (lambda (x)
                  (insert
                   (format "\"%s\"\n" (replace-regexp-in-string "\"" "\\\"" x))))
                lines)
        (insert "))\n"))
    (insert "(setq list-name '())")))

(global-set-key (kbd "M-Q") 'unfill-paragraph)

(defun unfill-paragraph ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

(defun unfill-region ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-region (region-beginning) (region-end) nil)))

(provide 'remfils-org-mode)
;;; remfils-org-mode.el ends here
