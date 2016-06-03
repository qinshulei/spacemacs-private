(setq qinshulei-packages
      '(
        ;; have been init by spacemacs
        avy
        expand-region
        move-dup
        browse-kill-ring
        anzu
        ))

(defun qinshulei/init-move-dup ()
  (use-package move-dup
    :config
    (global-set-key [M-up] 'md/move-lines-up)
    (global-set-key [M-down] 'md/move-lines-down)
    (global-set-key [M-S-up] 'md/move-lines-up)
    (global-set-key [M-S-down] 'md/move-lines-down)

    (global-set-key (kbd "C-c d") 'md/duplicate-down)
    (global-set-key (kbd "C-c D") 'md/duplicate-up)
    ))


(defun qinshulei/init-browse-kill-ring ()
  (use-package browse-kill-ring
    :config
    (setq browse-kill-ring-separator "\f")
    (global-set-key (kbd "M-Y") 'browse-kill-ring)
    (define-key browse-kill-ring-mode-map (kbd "C-g") 'browse-kill-ring-quit)
    (define-key browse-kill-ring-mode-map (kbd "M-n") 'browse-kill-ring-forward)
    (define-key browse-kill-ring-mode-map (kbd "M-p") 'browse-kill-ring-previous)
    ))

(defun qinshulei/init-anzu ()
  (use-package anzu
    :init
    (global-anzu-mode t)
    :config
    (progn
      (spacemacs|hide-lighter anzu-mode)
      (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)
      (global-set-key [remap query-replace] 'anzu-query-replace)
      )))
