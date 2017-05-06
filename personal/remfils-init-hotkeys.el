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
(global-set-key (kbd "M-U") 'backward-to-word-end)
(global-set-key (kbd "M-O") 'forward-word)

;; this should not be neccecary
; (global-set-key (kbd "M-'") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c C-w") 'ace-window)

; multy-curs
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C->") 'mc/mark-all-like-this)

(global-set-key (kbd "<f8>") 'neotree-toggle)

;; helm swoop

(global-set-key (kbd "C-c C-s") 'helm-swoop)
(defun remfils/helm-css-hook()
  (define-key css-mode-map (kbd "C-c C-s") 'helm-css-scss))
(add-hook 'css-mode-hook 'remfils/helm-css-hook)

(global-set-key (kbd "C-c p s w") 'helm-multi-swoop-projectile)

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

;; special js hook

(defun remfils/hotkeys-js2-mode-hook ()
  (define-key js2-mode-map (kbd "M-j") 'backward-char))

(add-hook 'js2-mode-hook 'remfils/hotkeys-js2-mode-hook)

(defun remfils/hotkeys-diff-mode-hook ()
  (define-key diff-mode-map (kbd "M-j") 'backward-char)
  (define-key diff-mode-map (kbd "M-k") 'next-line))

(add-hook 'diff-mode-hook 'remfils/hotkeys-diff-mode-hook)

(defun remfils/hotkeys-matlab-mode-hook ()
  (define-key matlab-mode-map (kbd "M-j") 'backward-char))

(add-hook 'matlab-mode-hook 'remfils/hotkeys-matlab-mode-hook)



;; evaluation function
(defun remfils/eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(global-set-key (kbd "C-c C-e") 'remfils/eval-and-replace)


(provide 'remfils-init-hotkeys)
;;; remfils-init-hotkeys.el ends here
