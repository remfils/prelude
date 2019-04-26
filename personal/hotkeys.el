(global-set-key (kbd "C-<tab>") 'yas-expand)

;; multy-curs
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C->") 'mc/mark-all-like-this)

;; neotree
(global-set-key (kbd "<f8>") 'neotree-toggle)

;; windows Ctrl+Z
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))
(global-set-key (kbd "C-z") 'undo-tree-undo)
(global-set-key (kbd "C-S-z") 'undo-tree-redo)

;; helm swoop
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)


;; org-mode
(define-key global-map "\C-ca" 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "M-Q") 'remfils/unfill-paragraph)

