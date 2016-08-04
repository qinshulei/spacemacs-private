(setq qinshulei-packages
      '(
        ;; have been init by spacemacs
        avy
        expand-region
        move-dup
        browse-kill-ring
        anzu
        dired+
        diff-hl
        highlight-indentation
        web-mode
        company
        helm-dash
        camcorder
        ))

(defun qinshulei/init-move-dup ()
  (use-package move-dup
    :config
    (global-set-key [M-up] 'md/move-lines-up)
    (global-set-key [M-down] 'md/move-lines-down)
    (global-set-key [M-S-up] 'md/move-lines-up)
    (global-set-key [M-S-down] 'md/move-lines-down)

    (global-set-key (kbd "C-c d") 'md/duplicate-down)
    (global-set-key (kbd "C-c D") 'md/duplicate-up)
    ))

(defun qinshulei/init-camcorder ()
  (use-package camcorder
    :config
    (define-key camcorder-mode-map (kbd "<f9>") 'camcorder-stop)
    (define-key camcorder-mode-map (kbd "C-x <f9>") 'camcorder-pause)
    ))


(defun qinshulei/init-browse-kill-ring ()
  (use-package browse-kill-ring
    :config
    (setq browse-kill-ring-separator "\f")
    (global-set-key (kbd "M-Y") 'browse-kill-ring)
    (define-key browse-kill-ring-mode-map (kbd "C-g") 'browse-kill-ring-quit)
    (define-key browse-kill-ring-mode-map (kbd "M-n") 'browse-kill-ring-forward)
    (define-key browse-kill-ring-mode-map (kbd "M-p") 'browse-kill-ring-previous)
    ))

(defun qinshulei/init-anzu ()
  (use-package anzu
    :init
    (global-anzu-mode t)
    :config
    (progn
      (spacemacs|hide-lighter anzu-mode)
      (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)
      (global-set-key [remap query-replace] 'anzu-query-replace)
      )))

(defun qinshulei/init-dired+ ()
  (use-package dired+
    :defer t
    :init
    (progn
      (setq diredp-hide-details-initially-flag nil)
      (setq diredp-hide-details-propagate-flag t)
      (when (fboundp 'global-dired-hide-details-mode)
        (global-dired-hide-details-mode -1))
      ;; use single buffer for all dired navigation
      ;; disable font themeing from dired+
      (setq font-lock-maximum-decoration (quote ((dired-mode . 1) (t . t))))
      ;; don't reuse dir
      ;; (toggle-diredp-find-file-reuse-dir 1)
      )))


(defun qinshulei/init-highlight-indentation ()
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
                                            shell-mode-hook
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


(defun qinshulei/post-init-diff-hl ()
  (use-package diff-hl
    :defer t
    :init
    (progn
      (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
      )))

(defun qinshulei/post-init-web-mode ()
  (use-package web-mode
    :defer t
    :mode
    (("\\.jelly\\'" . web-mode)
     ("\\.jsp\\'" . web-mode)
     ("\\.gsp\\'" . web-mode))))

(defun qinshulei/post-init-company ()
  (spacemacs|add-company-hook Shell-script-mode))

(defun qinshulei/post-helm-dash ()
  (use-package helm-dash
    :config
    (setq helm-dash-browser-func 'eww)
    (setq helm-dash-min-length 3)
    ))
