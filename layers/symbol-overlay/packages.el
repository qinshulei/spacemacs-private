(setq symbol-overlay-packages
      '(
        symbol-overlay
        ))


(defun symbol-overlay/init-symbol-overlay ()
  (use-package symbol-overlay
    :defer t
    :init
    (progn
      (require 'symbol-overlay)
      (global-set-key (kbd "M-i") 'symbol-overlay-put)
      (global-set-key (kbd "M-n") 'symbol-overlay-switch-forward)
      (global-set-key (kbd "M-p") 'symbol-overlay-switch-backward)
      (global-set-key (kbd "<f7>") 'symbol-overlay-mode)
      (global-set-key (kbd "<f8>") 'symbol-overlay-remove-all)
      )
    ))
