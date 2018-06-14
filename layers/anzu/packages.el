(setq anzu-packages
      '(anzu))

(defun anzu/init-anzu ()
  (use-package anzu
    :init
    (global-anzu-mode t)
    :config
    (progn
      (spacemacs|hide-lighter anzu-mode)
      (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)
      (global-set-key [remap query-replace] 'anzu-query-replace)
      )))
