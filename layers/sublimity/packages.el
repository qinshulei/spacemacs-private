(setq sublimity-packages
      '(sublimity))


(defun sublimity/init-sublimity ()
  "Initialize `sublimity'."
  (use-package sublimity
    :defer t
    :config
    (mapc (lambda (mode) (require mode))
          '(sublimity-scroll
            sublimity-map
            sublimity-attractive))
    ))
