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
                            helm-swoop
                            matlab-mode))

(require 'prelude-helm)
(require 'prelude-helm-everywhere)
(require 'prelude-web)

(provide 'remfils-packages)
;;; remfils-packages.el ends here
