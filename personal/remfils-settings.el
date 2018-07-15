;;; package --- Summary
;;; Commentary:
;;; Code:

(global-linum-mode 1)
(setq linum-format " %3d")

;; For number
(set-face-attribute 'linum nil :height 100)
(setq visible-bell 1)

(yas-global-mode 1)

(add-hook 'prog-mode-hook 'company-mode)

(electric-pair-mode 1)

(setq shift-select-mode nil)

(add-hook 'prog-mode-hook 'remfils/prog-mode-hook)
(defun remfils/prog-mode-hook ()
  (rainbow-delimiters-mode)
  (ggtags-mode))

(scroll-bar-mode -1)

;; autosave mode off
(setq auto-save-default t)
(setq create-lockfiles t)

; stop creating backup~ files
(setq make-backup-files t)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq gnus-dribble-directory
      `((".*" ,temporary-file-directory t)))

;; theme
;; (disable-theme 'zenburn)
;; (load-theme 'material t)

(setq neo-theme 'icons)

;; projectile settings

(add-to-list 'projectile-globally-ignored-directories "node_modules")
(add-to-list 'projectile-globally-ignored-directories "vendor")

(add-hook 'hack-local-variables-hook 'run-local-vars-mode-hook)
(defun run-local-vars-mode-hook ()
  "Run a hook for the major-mode after the local variables have been processed."
  (run-hooks (intern (concat (symbol-name major-mode) "-local-vars-hook"))))


(defun remfils/reload-dir-locals-for-current-buffer ()
  "reload dir locals for the current buffer"
  (interactive)
  (let ((enable-local-variables :all))
    (hack-dir-local-variables-non-file-buffer)))

(whitespace-mode -1)
(setq prelude-whitespace nil)

(setq
 whitespace-style
 '(face tabs spaces trailing lines space-before-tab indentation space-after-tab space-mark tab-mark))

(add-hook 'csharp-mode-hook 'omnisharp-mode)
(eval-after-load
    'company
  '(add-to-list 'company-backends 'company-omnisharp))

;; company mode

;; edit-server is an app to edit textareas in firefox
(edit-server-start)

;; src: http://endlessparentheses.com/disable-mouse-only-inside-emacs.html
(define-minor-mode disable-mouse-mode
  "A minor-mode that disables all mouse keybinds."
  :global t
  :lighter " -M-"
  :keymap (make-sparse-keymap))

(dolist (type '(mouse down-mouse drag-mouse
                      double-mouse triple-mouse))
  (dolist (prefix '("" C- M- S- M-S- C-M- C-S- C-M-S-))
    ;; Yes, I actually HAD to go up to 7 here.
    (dotimes (n 7)
      (let ((k (format "%s%s-%s" prefix type n)))
        (define-key disable-mouse-mode-map
          (vector (intern k)) #'ignore)))))

;; python cyrylic in term fix
(when (equal system-type 'windows-nt)
  (setenv "PYTHONIOENCODING" "utf-8"))

(provide 'remfils-settings)
;;; remfils-settings.el ends here
