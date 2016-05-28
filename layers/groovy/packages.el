(setq groovy-packages
      '(
        groovy-mode
        ))

(defun groovy/init-groovy-mode ()
  (use-package groovy-mode
    :config
    (add-hook 'groovy-mode-hook
              (lambda ()
                (c-set-style "java")))
    (add-hook 'java-mode-hook
              (lambda ()
                (c-set-style "java")))))
