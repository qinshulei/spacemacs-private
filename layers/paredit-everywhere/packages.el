(setq paredit-everywhere-packages
      '(paredit-everywhere))

(defun paredit-everywhere/init-paredit-everywhere ()
  (use-package paredit-everywhere
    :init
    (add-hook 'prog-mode-hook 'paredit-everywhere-mode)))
