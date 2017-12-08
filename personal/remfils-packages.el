;;; Code:
;;; package --- Summary
;;; these are additional packages for my emacs

(prelude-require-packages '(multiple-cursors
                            linum
                            emmet-mode
                            yaml-mode
                            redo+
                            ggtags
                            web-mode
                            php-mode
                            helm-swoop
                            helm-projectile
                            matlab-mode
                            js2-mode

                            helm-css-scss
                            web-beautify

                            rainbow-delimiters
                            rainbow-mode
                            neotree
                            all-the-icons

                            csharp-mode
                            omnisharp
                            indium

                            company
                            company-php
                            company-web
                            ledger-mode
                            yasnippet))

;; packages that could be installed locally
;;
;; - org-redmine

(require 'prelude-helm)
(require 'prelude-helm-everywhere)
(require 'prelude-web)

(eval-after-load 'php-mode
  '(require 'php-ext))


;; CUSTOM PACKAGES

(load-file "~/.emacs.d/personal/packages/remfils-templater.el")
(load-file "~/.emacs.d/personal/packages/remfils-redmine.el")

(provide 'remfils-packages)
;;; remfils-packages.el ends here
