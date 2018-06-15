(setq highlight-indentation-packages
      '(highlight-indentation))

(defun highlight-indentation/init-highlight-indentation ()
  (use-package highlight-indentationx
    :defer t
    :init
    (progn
      (dolist (highlight-indentation-hook '(lisp-mode-hook
                                            emacs-lisp-mode-hook
                                            scheme-mode-hook
                                            clojure-mode-hook
                                            ruby-mode-hook
                                            yaml-mode
                                            groovy-mode
                                            python-mode-hook
                                            shell-script-mode-hook
                                            php-mode-hook
                                            css-mode-hook
                                            nxml-mode-hook
                                            perl-mode-hook
                                            javascript-mode-hook))
        (add-hook highlight-indentation-hook 'highlight-indentation-mode)))
    :config
    (progn
      (set-face-background 'highlight-indentation-face "#183743")
      (set-face-background 'highlight-indentation-current-column-face "#193844")
      )))
