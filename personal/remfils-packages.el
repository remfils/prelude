;;; Code:
;;; package --- Summary
;;; these are additional packages for my emacs

(prelude-require-packages '(multiple-cursors
                            linum
                            emmet-mode
                            ace-jump-mode
                            redo+
                            ggtags
                            web-mode))

(require 'prelude-helm)
(require 'prelude-helm-everywhere)
(require 'prelude-web)

(provide 'remfils-packages)
;;; remfils-packages.el ends here
