(defun whitespace-empty-at-eob-regexp (limit)
  "Match spaces at end of buffer which do not contain the point at end of \
buffer."
  (let ((b (point))
	(e (1+ (buffer-size)))
	r)
    (cond
     ;; at eob
     ((= limit e)
      (goto-char limit)
      ;(setq r (whitespace-looking-back whitespace-empty-at-eob-regexp b)) ;; before
      (setq r (whitespace-looking-back whitespace-empty-at-eob-regexp whitespace-point)) ;; after
      (when (and r (= whitespace-point e))
        (setq r nil)
        (whitespace-point--used (match-beginning 0) (match-end 0)))
      (if r
	  (set-marker whitespace-eob-marker (match-beginning 1))
	(set-marker whitespace-eob-marker limit)
	(goto-char b)))			; return back to initial position
     ;; inside eob empty region
     ((>= b whitespace-eob-marker)
      (goto-char limit)
      (setq r (whitespace-looking-back whitespace-empty-at-eob-regexp b))
      (if r
	  (when (> (match-beginning 1) b)
	    (set-marker whitespace-eob-marker (match-beginning 1)))
	(set-marker whitespace-eob-marker limit)
	(goto-char b)))			; return back to initial position
     ;; intersection with beginning of eob empty region
     ((>= limit whitespace-eob-marker)
      (goto-char limit)
      (setq r (whitespace-looking-back whitespace-empty-at-eob-regexp b))
      (if r
	  (set-marker whitespace-eob-marker (match-beginning 1))
	(set-marker whitespace-eob-marker limit)
	(goto-char b)))			; return back to initial position
     ;; it is not inside eob empty region
     (t
      (setq r nil)))
    r))


(defun whitespace-post-command-hook ()
  "Save current point into `whitespace-point' variable.
Also refontify when necessary."
  (unless (and (eq whitespace-point (point))
               (not whitespace-buffer-changed))
    (setq whitespace-point (point))	; current point position
    (let ((refontify
           (cond
            ;; it is inside eob whitespace region ;; new
            (>= whitespace-point whitespace-eob-marker) ;; new
            
            ;; It is at end of buffer (eob).
            ((= whitespace-point (1+ (buffer-size)))
             (when (whitespace-looking-back whitespace-empty-at-eob-regexp
                                            nil)
               (match-beginning 0)))
            ;; It is at end of line ...
            ((and (eolp)
                  ;; ... with trailing SPACE or TAB
                  (or (memq (preceding-char) '(?\s ?\t))))
             (line-beginning-position))
            ;; It is at beginning of buffer (bob).
            ((and (= whitespace-point 1)
                  (looking-at whitespace-empty-at-bob-regexp))
             (match-end 0))))
          (ostart (overlay-start whitespace-point--used)))
      (cond
       ((not refontify)
        ;; New point does not affect highlighting: just refresh the
        ;; highlighting of old point, if needed.
        (when ostart
          (font-lock-flush ostart
                           (overlay-end whitespace-point--used))
          (delete-overlay whitespace-point--used)))
       ((not ostart)
        ;; Old point did not affect highlighting, but new one does: refresh the
        ;; highlighting of new point.
        (font-lock-flush (min refontify (point)) (max refontify (point))))
       ((save-excursion
          (goto-char ostart)
          (setq ostart (line-beginning-position))
          (and (<= ostart (max refontify (point)))
               (progn
                 (goto-char (overlay-end whitespace-point--used))
                 (let ((oend (line-beginning-position 2)))
                   (<= (min refontify (point)) oend)))))
        ;; The old point highlighting and the new point highlighting
        ;; cover a contiguous region: do a single refresh.
        (font-lock-flush (min refontify (point) ostart)
                         (max refontify (point)
                              (overlay-end whitespace-point--used)))
        (delete-overlay whitespace-point--used))
       (t
        (font-lock-flush (min refontify (point))
                         (max refontify (point)))
        (font-lock-flush ostart (overlay-end whitespace-point--used))
        (delete-overlay whitespace-point--used))))))
