(setq org-log-done 'time)

(setq org-agenda-files
      (list
       "tasks.org"
       "work.org"
       "univer.org"
       "periodic.org"
       "reading.org"
       "goals.org"
       ))

(when (boundp 'sync-org-path)
  (setq org-agenda-files
        (mapcar '(lambda (x) (concat sync-org-path x)) org-agenda-files))

  (let ((org-super-agenda-groups
         '((:auto-category t))))
    (org-agenda-list)))

(setq org-directory "~/.org")
(setq org-default-notes-file (concat org-directory "/notes.org"))

(when (not (boundp 'cloud-path))
  (setq cloud-path org-directory))


(setq org-capture-templates
      `(("t" "Todo" entry (file+headline ,(concat sync-org-path "tasks.org") "Общее")
         "* TODO %?\n   SCHEDULED: %T")
        ("w" "Todo work" entry (file+headline ,(concat sync-org-path "work.org") "Общее")
         "* TODO %?\n   SCHEDULED: %T")
        ("u" "Todo univer" entry (file+headline ,(concat sync-org-path "univer.org") "Общее")
         "* TODO %?\n   SCHEDULED: %T")
        ("r" "Work Report" entry (file+olp+datetree ,(concat sync-org-path "reports/work-report.org"))
         "* %T %?")
        ("j" "Journal" entry (file+olp+datetree ,(concat sync-org-path "journal/j.org"))
         "* %T\n%?")
        ("n" "Work notes" entry (file+olp+datetree ,(concat sync-org-path "notes/notes.org"))
         "* %T\n%?")
        ("l" "Local journal" entry (file+olp+datetree ,(concat org-directory "/local-j.org"))
         "* %T\n%?")
        ("c" "Code" entry (file+headline ,(concat org-directory "/code.org") "ОБЩЕЕ")
         "* %T\n%?")))

(when (equal system-type 'windows-nt)
      (org-babel-do-load-languages
       'org-babel-load-languages '((shell . t) (python . t) (perl . t) (sql . t) (ein . t))))

(when (equal system-type 'gnu/linux)
  (org-babel-do-load-languages
   'org-babel-load-languages '((shell . t) (python . t) (perl . t) (sql . t) (ein . t))))

(setq org-odt-category-map-alist
      '(("__Figure__" "Изображение" "value" "Изображение" org-odt--enumerable-image-p)))

;; should be configured in the OS to use python !
;;
;; python executables
;; (when (equal system-type 'windows-nt)
;;   (setq org-babel-python-command "C:\\Program Files (x86)\\Microsoft Visual Studio\\Shared\\Python36_64\\python.exe"))

;; (when (equal system-type 'gnu/linux)
;;   (setq org-babel-python-command "python3"))

;; agenda

(org-add-agenda-custom-command
 '("*" "Schedule unscheduled"
   ((todo ""
          ((org-agenda-skip-function '(org-agenda-skip-subtree-if 'scheduled))
           (org-agenda-overriding-header "To schedule: ")))
    (agenda ""))))


(provide 'org-mode)
