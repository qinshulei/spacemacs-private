(setq visual-regexp-packages
      '(
        visual-regexp
        visual-regexp-steroids
        ))

;; https://github.com/benma/visual-regexp.el
;; https://github.com/benma/visual-regexp-steroids.el

(defun visual-regexp/init-visual-regexp ()
  (use-package visual-regexp
    :init
    :ensure t))

(defun visual-regexp/init-visual-regexp-steroids ()
  (use-package visual-regexp-steroids
    :init
    :ensure t
    :ensure visual-regexp
    :bind (("C-M-%" . vr/replace)
           ("M-%"   . vr/query-replace)
           ("C-M-r"   . vr/isearch-backward)
           ("C-M-s"   . vr/isearch-forward)
           ("C-s" . isearch-forward)  ; ordinary forward search
           ("C-r" . isearch-backward) ; ordinary backward search
           ("C-c m" . vr/mc-mark)  ; for multiple-cursors
           )))
