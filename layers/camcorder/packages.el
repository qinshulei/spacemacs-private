(setq camcorder-packages
      '(camcorder))

(defun camcorder/init-camcorder ()
  (use-package camcorder
    :config
    (define-key camcorder-mode-map (kbd "<f9>") 'camcorder-stop)
    (define-key camcorder-mode-map (kbd "C-x <f9>") 'camcorder-pause)
    ))
