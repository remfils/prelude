(defun remfils/collect-org-file-todo-stat()
  "Use to calculate done/todo/canceled second level headings in a
  top level headings of org-mode buffer

use case:

#+NAME: stats
#+BEGIN_SRC emacs-lisp
  (remfils/collect-org-file-todo-stat)
#+END_SRC"
  (defun remfils/get-heading-statistics()
    (let
        ((name (cdr (assoc "ITEM" (org-entry-properties))))
         (done (length (org-map-entries t "/+DONE" 'tree)))
         (todo (length (org-map-entries t "/+TODO" 'tree)))
         (canceled (length (org-map-entries t "/+CANCELED" 'tree))))
      (list name done todo canceled)))
  (append
   '(("Имя" "Сделано" "Не сделано" "Отменено") hline)
   (org-map-entries #'remfils/get-heading-statistics "LEVEL=1" nil)))
