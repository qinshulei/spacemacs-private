(defun qinshulei/post-init-expand-region ()
  (with-eval-after-load 'expand-region
    (global-set-key (kbd "C-=") 'er/expand-region)))
