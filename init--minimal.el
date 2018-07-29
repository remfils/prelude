(package-initialize)

(let ((modes (list
              'multiple-cursors
              'linum
              'emmet-mode
              'web-mode
              'php-mode
              'js2-mode
              'rainbow-delimiters
              'rainbow-mode
              'company
              'ledger-mode
              'yasnippet
              'helm
              'helm-config
              ))
      (personal-files (list
              "init-hotkeys"
              "lang"
              "org-mode"
              "overrides"
              "russian"
              "settings"
              "web-dev")))
  (mapc (lambda (x) (require x)) modes)
  (mapc (lambda (x) (load (concat "~/.emacs.d/personal/remfils-" x ".el"))) personal-files))
