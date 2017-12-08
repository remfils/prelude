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
