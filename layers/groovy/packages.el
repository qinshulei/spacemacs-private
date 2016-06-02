(setq groovy-packages
      '(
        company
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

(defun groovy/post-init-company ()
  (spacemacs|add-company-hook groovy-mode))
