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
