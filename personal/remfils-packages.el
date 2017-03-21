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
                            matlab-mode
                            js2-mode

                            helm-css-scss
                            web-beautify))

(require 'prelude-helm)
(require 'prelude-helm-everywhere)
(require 'prelude-web)

(eval-after-load 'php-mode
  '(require 'php-ext))

(provide 'remfils-packages)
;;; remfils-packages.el ends here
