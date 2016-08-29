(setq bm-packages
      '(
        bm
        ))

;; https://github.com/joodland/bm

(defun bm/init-bm ()
  (use-package bm
    :init
    (setq bm-in-lifo-order t) ;;cycle bookmark in LIFO order
    :bind (([f5] . bm-next)
           ([C-f5] . bm-toggle)
           ([S-f5] . bm-show-all)
           ([f6] . bm-previous)
           ([C-f6] . bm-bookmark-annotate)
           ([S-f6] . bm-remove-all-current-buffer)
           )))
