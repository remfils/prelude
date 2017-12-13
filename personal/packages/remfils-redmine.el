(require 'org-redmine)

(defun org-redmine-helm-show-issue-all (&optional me)
  "Display recent issues using `helm'"
  (interactive "P")
  (if (require 'helm nil t)
      (helm :sources (helm-make-source "Issues" 'helm-source-sync
                       :candidates (lambda () (org-redmine-get-issue-all me))
                       :candidate-transformer '(org-redmine-transformer-issues-source)
                       :volatile t
                       :action '(("Open Browser"
                                  . (lambda (issue) (browse-url (org-redmine-issue-uri issue))))
                                 ("Insert Subtree"
                                  . (lambda (issue) (org-redmine-insert-subtree issue)))
                                 ("Insert Subtree (Multiselection)"
                                  . (lambda (issue) (loop for cand in (helm-marked-candidates) do
                                                          (org-redmine-insert-subtree cand)))))))
    (message "`helm` is not available. Please install it.")))

;; (defun org-redmine-visit-issue ())

(defun org-redmine-visit-issue-at-point ()
  (interactive)
  (let ((current-line (thing-at-point 'line t)))
    (message current-line)
    (if (string-match "^\\\* #\\([0-9]+\\) " current-line)
        (let ((issue-id (match-string 1 current-line)))
          (browse-url (format "%s/issues/%s" org-redmine-uri issue-id)))
      (message "No issue id was found"))))

(defun org-redmine-get-issue-open (me)
  "Return the recent issues (list of hash-table).
When error occurs, return list of error message.

if ME is t, return issues are assigned to user.
"
  (let ((querylist (list (cons "limit" (org-redmine-config-get-limit t))))
        query issue-all)

    (condition-case err
        (progn
          (if me (add-to-list 'querylist (cons "assigned_to_id" "me")))
          (add-to-list 'querylist (cons "status_id" "open" ))
          (setq query (orutil-http-query querylist))
          (setq issue-all (org-redmine-curl-get
                           (concat org-redmine-uri "/issues.json?" query)))
          (orutil-gethash issue-all "issues"))
      (org-redmine-exception-not-retrieved
       (orutil-print-error (format "%s: Can't get issues on %s"
                                   (error-message-string err) org-redmine-uri))))))

(defun org-redmine-helm-show-issue-open (&optional me)
  "Display recent issues using `helm'"
  (interactive "P")
  (if (require 'helm nil t)
      (helm :sources (helm-make-source "Issues" 'helm-source-sync
                       :candidates (lambda () (org-redmine-get-issue-open me))
                       :candidate-transformer '(org-redmine-transformer-issues-source)
                       :volatile t
                       :action '(("Open Browser"
                                  . (lambda (issue) (browse-url (org-redmine-issue-uri issue))))
                                 ("Insert Subtree"
                                  . (lambda (issue) (org-redmine-insert-subtree issue))))))
    (message "`helm` is not available. Please install it.")))


(defun org-redmine-get-issue-closed (me)
  "Return the recent issues (list of hash-table).
When error occurs, return list of error message.

if ME is t, return issues are assigned to user.
"
  (let ((querylist (list (cons "limit" (org-redmine-config-get-limit t))))
        query issue-all)

    (condition-case err
        (progn
          (if me (add-to-list 'querylist (cons "assigned_to_id" "me")))
          (add-to-list 'querylist (cons "status_id" "closed" ))
          (setq query (orutil-http-query querylist))
          (setq issue-all (org-redmine-curl-get
                           (concat org-redmine-uri "/issues.json?" query)))
          (orutil-gethash issue-all "issues"))
      (org-redmine-exception-not-retrieved
       (orutil-print-error (format "%s: Can't get issues on %s"
                                   (error-message-string err) org-redmine-uri))))))

(defun org-redmine-helm-show-issue-closed (&optional me)
  "Display recent issues using `helm'"
  (interactive "P")
  (if (require 'helm nil t)
      (helm :sources (helm-make-source "Issues" 'helm-source-sync
                       :candidates (lambda () (org-redmine-get-issue-closed me))
                       :candidate-transformer '(org-redmine-transformer-issues-source)
                       :volatile t
                       :action '(("Open Browser"
                                  . (lambda (issue) (browse-url (org-redmine-issue-uri issue))))
                                 ("Insert Subtree"
                                  . (lambda (issue) (org-redmine-insert-subtree issue))))))
    (message "`helm` is not available. Please install it.")))
