(cua-mode t)

(global-set-key (kbd "M-i") 'previous-line) ; was tab-to-tab-stop wasd
(global-set-key (kbd "M-k") 'next-line) ; was kill-sentence
(global-set-key (kbd "M-j") 'backward-char) ; was indent-new-comment-line
(global-set-key (kbd "M-l") 'forward-char)
(global-set-key (kbd "M-[") 'backward-paragraph)
(global-set-key (kbd "M-]") 'forward-paragraph)

(global-set-key (kbd "M-u") 'backward-word)
(global-set-key (kbd "M-o") 'forward-to-word-begin)
(define-key prelude-mode-map (kbd "M-o") 'forward-to-word-begin)
;(define-key c-mode-map (kbd "M-j") 'backward-char)
;(define-key js2-mode-map (kbd "M-j") 'backward-char)
(global-set-key (kbd "M-U") 'backward-to-word-end)
(global-set-key (kbd "M-O") 'forward-word)

;; this should not be neccecary
; (global-set-key (kbd "M-'") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c C-w") 'ace-window)

; multy-curs
(global-set-key (kbd "C-d") 'mc/mark-next-like-this)
(global-set-key (kbd "C-S-d") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-d") 'mc/mark-all-like-this)

;; ace-jump config
(global-set-key (kbd "C-c SPC") 'ace-jump-word-mode)
(global-set-key (kbd "C-c C-u SPC") 'ace-jump-char-mod)
(global-set-key (kbd "C-c C-u C-u SPC") 'ace-jump-line-mode)

;; undo

;; Unbind Pesky Sleep Button
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))

;; Windows Style Undo
(global-set-key (kbd "C-z") 'undo-tree-undo)

(global-set-key (kbd "C-S-z") 'undo-tree-redo)

;; funcs

(defun forward-to-word-begin()
  (interactive)
  (forward-word)
  (forward-word)
  (backward-word))

(defun backward-to-word-end()
  (interactive)
  (backward-word)
  (backward-word)
  (forward-word))


(provide 'remfils-init-hotkeys)
;;; remfils-init-hotkeys.el ends here
