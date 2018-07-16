;; (cua-mode t)

(global-set-key (kbd "C-<tab>") 'yas/expand)

(global-set-key (kbd "<f12>") 'omnisharp-go-to-definition)
(global-set-key (kbd "S-<f12>") 'omnisharp-go-to-definition-other-window)

;; (global-set-key (kbd "M-i") 'previous-line) ; was tab-to-tab-stop wasd
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

;; helm swoop

;; Change the keybinds to whatever you like :)
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

;; When doing isearch, hand the word over to helm-swoop
(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)

(when (boundp 'helm-swoop-map)
  (progn
    ;; Instead of helm-multi-swoop-all, you can also use helm-multi-swoop-current-mode    
    (define-key helm-swoop-map (kbd "M-m") 'helm-multi-swoop-current-mode-from-helm-swoop)
    ;; From helm-swoop to helm-multi-swoop-all
    ;; When doing evil-search, hand the word over to helm-swoop
    ;; (define-key evil-motion-state-map (kbd "M-i") 'helm-swoop-from-evil-search)
    (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)))

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
  (define-key js2-mode-map (kbd "M-j") 'backward-char)
  (define-key js2-mode-map (kbd "C-c C-p") 'js-comint-repl)
  (define-key js2-mode-map (kbd "C-c C-r") 'js-comint-send-region)
  (define-key js2-mode-map (kbd "C-c C-c") 'js-comint-send-buffer))

(add-hook 'js2-mode-hook 'remfils/hotkeys-js2-mode-hook)

(defun remfils/hotkeys-diff-mode-hook ()
  (define-key diff-mode-map (kbd "M-j") 'backward-char)
  (define-key diff-mode-map (kbd "M-k") 'next-line))

(add-hook 'diff-mode-hook 'remfils/hotkeys-diff-mode-hook)

(defun remfils/hotkeys-matlab-mode-hook ()
  (define-key matlab-mode-map (kbd "M-j") 'backward-char))

(add-hook 'matlab-mode-hook 'remfils/hotkeys-matlab-mode-hook)

;; avy fix

(defun remfils/avy-goto-word-or-subword-1 (arg char)
  (interactive "P\ncchar:")
  (if arg
      (avy-goto-subword-1 char)
    (avy-goto-word-1 char)))

(global-set-key (kbd "C-c j") 'remfils/avy-goto-word-or-subword-1)



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

(global-set-key (kbd "<backtab>") 'company-complete-common)

(defun remfils/omnisharp-keys-hook ()
  (define-key csharp-mode-map (kbd "<f12>") 'omnisharp-go-to-definition))
(add-hook 'csharp-mode-hook 'remfils/omnisharp-keys-hook)

(provide 'remfils-init-hotkeys)
;;; remfils-init-hotkeys.el ends here
