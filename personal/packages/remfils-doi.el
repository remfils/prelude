;; functions for file renaming according to doi
;;

(require 'json)

(cl-defstruct doi-object
  title year journal authors)

(cl-defstruct doi-author
  surname name)

(defun testing(doi)
  (let ((doi-o (remfils/get-doi-object-from-doi doi)))
    (message "Title: %S" (doi-object-title doi-o))))


(defun remfils/get-doi-object-from-doi (doi)
  (let ((json-object-type 'hash-table)
        (json-array-type 'list)
        (json-key-type 'string))
    (request
     (concat "http://dx.doi.org/" doi)
     :headers
     '(("Accept" . "application/vnd.citationstyles.csl+json"))
     :parser 'json-read
     :success
     (cl-function
      (lambda (&key data &allow-other-keys)
        (let* ((title (cdr (assoc 'title data)))
               (authors (doi-json/parse-authors (cdr (assoc 'author data)))))
          (make-doi-object :title title :authors authors))))
     :error
     (cl-function (lambda (&key error-thrown &allow-other-keys&rest _)
                    (message "Got error: %S" error-thrown))))))


;; [((given . "I. V.") (family . "Dzedolik") (sequence . "first") (affiliation . [])) ((given . "V. S.") (family . "Pereskokov") (sequence . "additional") (affiliation . []))]
(defun doi-json/parse-authors (authors-struct)
  (mapcar
   (lambda (author-elem)
     (make-doi-author :surname (cdr (assoc 'family author-elem)) :name (cdr (assoc 'given author-elem))))
   authors-struct))


(remfils/get-doi-object-from-doi "10.1134/S1024856017020087")
(testing "10.1134/S1024856017020087")
