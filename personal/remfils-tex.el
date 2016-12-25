;; Use MuPDF as previewer
;; 18oct2012  +chris+
(eval-after-load 'tex
  '(add-to-list 'TeX-view-program-list
                '("mupdf" ("mupdfwrap" (mode-io-correlate " -p %(outpage)") " %o"))))
(eval-after-load 'tex
  '(add-to-list 'TeX-view-program-selection
                '(output-pdf "mupdf")))
