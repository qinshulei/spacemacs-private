(setq qinshulei-packages
      '(
        ;; have been init by spacemacs
        avy
        expand-region
        browse-kill-ring
        dired+
        diff-hl
        web-mode
        company
        helm
        ;; better helm sort and fuzzy match
        helm-flx
        helm-fuzzier
        helm-dash
        org
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

(defun qinshulei/post-init-helm-dash ()
  (use-package helm-dash
    :config
    (setq helm-dash-browser-func 'eww)
    (setq helm-dash-min-length 3)
    (add-hook 'shell-script-mode-hook 'dash-bash-docs)
    (add-hook 'java-mode-hook 'dash-java-docs)
    (add-hook 'python-mode-hook 'dash-python-docs)
    (add-hook 'css-mode-hook 'dash-css-docs)
    (add-hook 'js2-mode-hook 'dash-javascript-docs)
    (add-hook 'web-mode-hook 'dash-web-docs)
    ))

(defun qinshulei/post-init-flycheck ()
  (spacemacs/add-flycheck-hook 'sh-mode))

(defun qinshulei/post-init-helm ()
  (use-package helm
    :config
    (setq helm-M-x-prefix-argument t)
    ))

(defun qinshulei/init-helm-fuzzier ()
  (use-package helm-fuzzier
    :config
    (helm-fuzzier-mode 1)
    ))

(defun qinshulei/init-helm-flx ()
  (use-package helm-flx
    :config
    (helm-flx-mode +1)
    ))

(defun spacemacs-editing/post-init-expand-region ()
  (global-set-key (kbd "C-=") 'er/expand-region))

(defun spacemacs-editing/post-init-avy ()
  (global-set-key (kbd "C-;") 'avy-goto-word-or-subword-1))

(defun qinshulei/pre-init-org ()
  (spacemacs|use-package-add-hook org
    :post-init
    ;; Enable Babel evaluation of JavaScript, Dot.
    (require 'ob-js)
    (require 'ob-dot)
    :post-config
    (add-to-list 'org-babel-load-languages '(dot . t))

    ;; Automatically redisplay images after executing code.  Great for Dot
    ;; graphs source blocks.
    (add-hook 'org-babel-after-execute-hook 'org-display-inline-images)
    ))
