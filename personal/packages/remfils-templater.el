(require 'subr-x)
(require 's)

(defun remfils/templater/csv-line-to-list (csv-string)
  "parses line of text into list ignoring comas in quotes. "
  (let (result (csv-item "") (quote-counter 1))
    (dolist (csv-char (append csv-string nil) result)
      (cond
       ((char-equal csv-char ?\")
        (setq quote-counter (* quote-counter -1)))
       ((char-equal csv-char ?\,)
        (if (= quote-counter 1)
            (progn
              (setq result (append result (cons (string-trim csv-item) nil)))
              (setq csv-item ""))
          (setq csv-item (concat csv-item (char-to-string csv-char)))))
       (t (setq csv-item (concat csv-item (char-to-string csv-char))))))
    (setq result (append result (cons (string-trim csv-item) nil)))))

(defun remfils/templater/csv-text-to-list (csv-text)
  (let ((csv-line-list (split-string csv-text "\n" t)) result)
    (dolist (csv-line csv-line-list result)
      (setq result (append result (cons (remfils/templater/csv-line-to-list csv-line) nil))))))

(defun remfils/templater/generate-template-string-from-csv (template csv-text)
  (let ((var-rows (remfils/templater/csv-text-to-list csv-text)) result)
    (dolist (var-row var-rows result)
      (setq result (concat result (s-format template 'elt var-row))))))

(defun remfils/templater/generate-text-from-csv (template csv-text)
  (interactive "stemplate:\nscsv text:")
  (insert (remfils/templater/generate-template-string-from-csv template csv-text)))
