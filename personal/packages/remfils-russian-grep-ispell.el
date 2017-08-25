(defun remfils/projectile-grep-russian-words ()
  (interactive)
  (let ((russian-word-regexp "[А-Яа-я]\\{1,\\}"))
    (projectile-grep russian-word-regexp)))


(defun remfils/leave-misspelled-lines-in-buffer ()
  (interactive)
  (let ((more-lines t))
    (beginning-of-buffer)
    (while more-lines
      (when (not (remfils/kill-line-if-not-misspelled-russian))
        (setq more-lines (= 0 (forward-line 1)))))))

(defun remfils/kill-line-if-not-misspelled-russian ()
  (let ((misspeled-word-found nil)
        (more-words t)
        (ispell-quietly t)
        (ispell-dictionary "russian"))
    (beginning-of-line)
    (narrow-to-region (line-beginning-position) (line-end-position))
    (while more-words
      (setq more-words (search-forward-regexp "[А-Яа-я]\\{1,\\}" nil t))
      (when more-words
        (setq misspeled-word-found (or misspeled-word-found (not (remfils/ispell-word-at-point-p))))))
    (widen)
    (if (not misspeled-word-found)
        (progn
          (beginning-of-line)
          (kill-line)
          (kill-line)
          t)
      nil)))

(defun remfils/ispell-word-at-point-p ()
  (let ((word (car (ispell-get-word nil))))
    (ispell-set-spellchecker-params)    ; Initialize variables and dicts alists
    (ispell-accept-buffer-local-defs)	; use the correct dictionary
    (ispell-send-string "%\n")
    (ispell-send-string (concat "^" word "\n"))
    (while (progn
             (ispell-accept-output)
             (not (string= "" (car ispell-filter)))))
    (setq ispell-filter (cdr ispell-filter)) ; remove extra \n
    (if (and ispell-filter (listp ispell-filter))
        (if (> (length ispell-filter) 1)
            (error "Ispell and its process have different character maps")
          (setq poss (ispell-parse-output (car ispell-filter)))))
    (if (and (listp poss) (stringp (car poss)))
        nil
      t)))
