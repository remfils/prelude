(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (toggle-truncate-lines t)))


(setq sql-connection-alist
      '((work/science-days (sql-product 'postgres)
                           (sql-port 5432)
                           (sql-server "10.100.112.25")
                           (sql-user "sciencedayuser")
                           (sql-database "SciencedaysDB"))
        '((work/physteh (sql-product 'mysql)
                        (sql-server "10.100.112.143")
                        (sql-user "root")
                        (sql-database "SciencedaysDB"))
        )))
