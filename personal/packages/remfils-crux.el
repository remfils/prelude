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

;; evaluation function
(defun remfils/eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))


;; unfill paragrpas

(defun remfils/unfill-paragraph ()
  "return filled paragraph to normal"
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

(defun remfils/unfill-region ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-region (region-beginning) (region-end) nil)))


;; collect images in org document

(defun remfis/org-collect-images (dir-name)
  (interactive "sdir name:")
  (let
      ((new-img-dir (concat default-directory dir-name "/"))
       (images (remfils/grab-all-images-from-org-file)))
    (unless (file-exists-p new-img-dir)
      (make-directory new-img-dir))
    ;; copy found images
    (mapcar (lambda (old-img-url)
              (let* ((new-file-name (file-name-nondirectory old-img-url))
                     (new-img-url (concat new-img-dir new-file-name)))
                (copy-file old-img-url new-img-url)

                (let (
                      (old-url (org-link-escape old-img-url))
                      (new-url (replace-regexp-in-string default-directory "./" (org-link-escape new-img-url)))
                      )
                  (goto-char (point-min))
                  (while (search-forward old-url nil t)
                    (replace-match new-url)))))
            images)))

(defun remfils/grab-all-images-from-org-file ()
  (org-element-map (org-element-parse-buffer) 'link
    (lambda (link)
      (when (string-match "\.png" (org-element-property :path link))
        (org-link-unescape (org-element-property :path link))))))


(defun remfils/copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))
