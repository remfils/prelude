(require 'prelude-helm-everywhere)
(require 'prelude-web)

(eval-after-load 'php-mode
  '(require 'php-ext))

(prelude-require-packages '(multiple-cursors
                                        ;linum
                            emmet-mode
                            ggtags
                            helm-swoop
                            web-beautify
			    org
                            rainbow-delimiters
                            rainbow-mode
                            ;neotree
                            ;all-the-icons
                            elpy
                            ob-ipython
                            pdf-tools
                            ein
                            csharp-mode
                            ;omnisharp
                            ledger-mode
                            yasnippet
                            openwith
                            ))

;; pdf-tools
(pdf-tools-install)
(add-hook 'pdf-view-mode-hook (lambda()
                                (linum-mode -1)))


;; CUSTOM PACKAGES

(load-file "~/.emacs.d/personal/packages/disable-mouse-mode.el")
(load-file "~/.emacs.d/personal/packages/remfils-templater.el")
(load-file "~/.emacs.d/personal/packages/remfils-crux.el")
;; (load-file "~/.emacs.d/personal/packages/remfils-org-img-mover.el")
(load-file "~/.emacs.d/personal/packages/remfils-python.el")


;; org mode priority

;;set colours for org-mode

(setq org-priority-faces '((?A . (:foreground "#F0DFAF" :weight bold))
                           (?B . (:foreground "LightSteelBlue"))
                           (?C . (:foreground "OliveDrab"))))

(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w!)" "|" "DONE(d!)" "CANCELED(c!)")))

(setq org-todo-keyword-faces
      '(("TODO" . org-warning) ("WAIT" . "orange")
        ("CANCELED" . (:foreground "#ffb6b2" :weight bold))))



(provide 'prelude-modules)
