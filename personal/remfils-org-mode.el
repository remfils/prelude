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
      (list
       "org/t.org"
       "org/work.org"
       "org/univer.org"
       ))

(setq org-agenda-files
      (mapcar '(lambda (x) (concat cloud-path x)) org-agenda-files))


(let ((org-super-agenda-groups
       '((:auto-category t))))
  (org-agenda-list))


;; CAPTURE

(global-set-key (kbd "C-c c") 'org-capture)

(setq org-directory "~/.org")

(setq org-default-notes-file (concat org-directory "/notes.org"))

(setq org-capture-templates
      `(("t" "Todo" entry (file+headline ,(concat org-directory "/t.org") "Общее")
         "* TODO %?\n %T\n %a")
        ("w" "Todo" entry (file+headline ,(concat cloud-path "org/work.org") "Общее")
         "* TODO %?\n %T")
        ("u" "Todo" entry (file+headline ,(concat cloud-path "org/univer.org") "Общее")
         "* TODO %?\n %T")
        ("j" "Journal" entry (file+datetree ,(concat cloud-path "org/j.org"))
         "* %T\n%?")
        ("n" "Work notes" entry (file+datetree ,(concat cloud-path "org/notes.org"))
         "* %T\n%?")
        ("l" "Local journal" entry (file+datetree ,(concat org-directory "/local-j.org"))
         "* %T\n%?")
        ("c" "Code" entry (file+headline ,(concat org-directory "/code.org") "ОБЩЕЕ")
         "* %T\n%?")))

(org-babel-do-load-languages
 'org-babel-load-languages '((shell . t) (python . t) (perl . t)))

(setq org-odt-category-map-alist
      '(("__Figure__" "Изображение" "value" "Изображение" org-odt--enumerable-image-p)))

(add-hook 'org-agenda-finalize-hook
          `remfils/org-agenda-colors)

(defun remfils/org-agenda-colors()
      (save-excursion
        (color-org-header "$$$:" "black" "lightgreen")
        (color-org-header "work:" "tan" "SaddleBrown")
        (color-org-header "сайт_" "tan" "SaddleBrown")
        (color-org-header "кукиит:" "bisque" "bisque4")
        (color-org-header "асп:" "DeepSkyBlue" "white")
        (color-org-header "др:" "orange" "white")
        ))

(defun color-org-header (tag backcolor forecolor)
  ""
  (interactive)
  (goto-char (point-min))
  (while (re-search-forward tag nil t)
    (add-text-properties (match-beginning 0) (- (match-end 0) 1)
                         `(face (:background, backcolor, :foreground, forecolor)))))


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


;; python executables
(when (equal system-type 'windows-nt)
  (setq org-babel-python-command "C:\\Program Files (x86)\\Microsoft Visual Studio\\Shared\\Python36_64\\python.exe"))

(when (equal system-type 'gnu/linux)
  (setq org-babel-python-command "python3"))


(provide 'remfils-org-mode)
;;; remfils-org-mode.el ends here
