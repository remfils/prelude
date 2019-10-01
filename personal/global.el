
;; numbers
(global-linum-mode 0)
;(setq linum-format " %3d")

;(set-face-attribute 'linum nil :height 100)
;(setq visible-bell 1)

;; yas
(yas-global-mode 1)

;; braces
(electric-pair-mode 1)
(add-hook 'prog-mode-hook 'remfils/prog-mode-hook)
(defun remfils/prog-mode-hook ()
  (rainbow-delimiters-mode))

;; UI

(scroll-bar-mode -1)
(setq neo-theme 'icons)

;; backups

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq gnus-dribble-directory
      `((".*" ,temporary-file-directory t)))

;; dont highlight whitespace chars
(setq prelude-whitespace nil)

;; projectils
(add-to-list 'projectile-globally-ignored-directories "node_modules")
(add-to-list 'projectile-globally-ignored-directories "vendor")


;; python cyrylic in term fix
(when (equal system-type 'windows-nt)
  (setenv "PYTHONIOENCODING" "utf-8"))

;; windows tramp
(when (equal system-type 'windows-nt)
  (setq tramp-default-method "plink"))


(setenv "SSH_ASKPASS" "git-gui--askpass")
