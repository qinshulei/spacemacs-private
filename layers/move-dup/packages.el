(setq move-dup-packages
      '(move-dup))

(defun move-dup/init-move-dup ()
  (use-package move-dup
    :config
    (global-set-key [M-up] 'md/move-lines-up)
    (global-set-key [M-down] 'md/move-lines-down)
    (global-set-key [M-S-up] 'md/move-lines-up)
    (global-set-key [M-S-down] 'md/move-lines-down)
    (global-set-key (kbd "C-c d") 'md/duplicate-down)
    (global-set-key (kbd "C-c D") 'md/duplicate-up)
    ))
