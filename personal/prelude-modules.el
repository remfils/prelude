(require 'prelude-helm-everywhere)
(require 'prelude-web)

(eval-after-load 'php-mode
  '(require 'php-ext))

(prelude-require-packages '(multiple-cursors
                            ;linum
                            ggtags
                            helm-swoop
                            web-beautify
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
                            yasnippet))

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

(provide 'prelude-modules)
