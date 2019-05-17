(setq org-log-done 'time)

(setq org-agenda-files
      (list
       "org/t.org"
       "org/work.org"
       "org/univer.org"
       ))

(when (boundp 'cloud-path)
  (setq org-agenda-files
        (mapcar '(lambda (x) (concat cloud-path x)) org-agenda-files))

  (let ((org-super-agenda-groups
         '((:auto-category t))))
    (org-agenda-list)))

(setq org-directory "~/.org")
(setq org-default-notes-file (concat org-directory "/notes.org"))

(when (not (boundp 'cloud-path))
  (setq cloud-path org-directory))


(setq org-capture-templates
      `(("t" "Todo" entry (file+headline ,(concat cloud-path "org/t.org") "Общее")
         "* TODO %?\n %T\n %a")
        ("w" "Todo work" entry (file+headline ,(concat cloud-path "org/work.org") "Общее")
         "* TODO %?\n %T")
        ("u" "Todo univer" entry (file+headline ,(concat cloud-path "org/univer.org") "Общее")
         "* TODO %?\n %T")
        ("j" "Journal" entry (file+datetree ,(concat cloud-path "org/j.org"))
         "* %T\n%?")
        ("n" "Work notes" entry (file+datetree ,(concat cloud-path "org/notes.org"))
         "* %T\n%?")
        ("l" "Local journal" entry (file+datetree ,(concat org-directory "/local-j.org"))
         "* %T\n%?")
        ("c" "Code" entry (file+headline ,(concat org-directory "/code.org") "ОБЩЕЕ")
         "* %T\n%?")))

(cond (equal system-type 'windows-nt)
      (org-babel-do-load-languages
       'org-babel-load-languages '((shell . t) (python . t) (perl . t) (sql . t)))
      (org-babel-do-load-languages
       'org-babel-load-languages '((shell . t) (python . t) (perl . t) (sql . t) (ipython . t))))

(setq org-odt-category-map-alist
      '(("__Figure__" "Изображение" "value" "Изображение" org-odt--enumerable-image-p)))


;; python executables
(when (equal system-type 'windows-nt)
  (setq org-babel-python-command "C:\\Program Files (x86)\\Microsoft Visual Studio\\Shared\\Python36_64\\python.exe"))

(when (equal system-type 'gnu/linux)
  (setq org-babel-python-command "python3"))


(provide 'org-mode)
