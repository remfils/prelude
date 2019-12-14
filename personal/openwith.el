(require 'openwith)

(setq remfils/programs
      '(
        ("writer" . "C:\\Program Files\\LibreOffice\\program\\swriter.exe")
        ("calc" . "C:\\Program Files\\LibreOffice\\program\\scalc.exe")
        ))

(setq openwith-associations
      (list
       (list (openwith-make-extension-regexp
              '("doc" "docx" "odt"))
             (assoc "writer" remfils/programs)
             '(file))
       (list (openwith-make-extension-regexp
              '("xls" "xlsx" "ods"))
             (assoc "calc" remfils/programs)
             '(file))
       ))

(openwith-mode 1)
