(require 'openwith)

(setq remfils/programs
      (cond
       ;; windows
       ((string-equal system-type "windows-nt")
        '(("writer" . "C:\\Program Files\\LibreOffice\\program\\swriter.exe")
          ("calc" . "C:\\Program Files\\LibreOffice\\program\\scalc.exe"))
        )
       ;; linux
       ((string-equal system-type "gnu/linux") ; linux
        '(("writer" . "libreoffice")
          ("calc" . "libreoffice"))
        )))

(setq openwith-associations
      (list
       (list (openwith-make-extension-regexp
              '("doc" "docx" "odt"))
             (cdr (assoc "writer" remfils/programs))
             '(file))
       (list (openwith-make-extension-regexp
              '("xls" "xlsx" "ods"))
             (cdr (assoc "calc" remfils/programs))
             '(file))
       ))

(openwith-mode 1)
