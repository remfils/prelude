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
                      (old-url old-img-url)
                      (new-url (replace-regexp-in-string default-directory "./" new-img-url))
                      )
                  (goto-char (point-min))
                  (while (search-forward old-url nil t)
                    (replace-match new-url)))))
            images)))

(defun remfils/grab-all-images-from-org-file ()
  (org-element-map (org-element-parse-buffer) 'link
    (lambda (link)
      (when (string-match "\.png" (org-element-property :path link))
        (org-element-property :path link)))))
