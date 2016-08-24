;; function
(defun print-upper-region ()
  "Demo to print the uppercased version of the active region."
  (interactive)
  (when (region-active-p)
    (message "%S" (let ((string (buffer-substring (region-beginning)
                                                  (region-end))))
                    (with-temp-buffer
                      (insert string)
                      (upcase-region (point-min)
                                     (point-max))
                      (buffer-substring-no-properties (point-min)
                                                      (point-max)))))))


;; major-mode
(define-derived-mode hypertext-mode
  text-mode "Hypertext"
  "Major mode for hypertext.
 \\{hypertext-mode-map}"
  (setq case-fold-search nil))

(define-key hypertext-mode-map
  [down-mouse-3] 'do-hyper-link)

;; minor mode
(defvar elisp-guide-mode-map (make-sparse-keymap))
(define-minor-mode elisp-guide-mode "A simple minor mode example."
  :lighter " ELGuide"
  :keymap elisp-guide-mode-map
  (if (bound-and-true-p elisp-guide-mode)
      (message "Elisp guide activated!")
    (message "Bye!")))
(define-key elisp-guide-mode-map (kbd "C-c C-a") 'elisp-guide-go)
(defun elisp-guide-go ()
  (interactive)
  (message "Go!"))

;; marker
(defun my-indent-region (beg end)
  (interactive "r")
  (let ((marker (make-marker)))
    (set-marker marker (region-end))
    (goto-char (region-beginning))
    (while (< (point) marker)
      (funcall indent-line-function)
      (forward-line 1))))

;; insert
(defun insert-name ()
  (interactive)
  (insert "qinshulei")
  )

(defun insert-mail ()
  (interactive)
  (insert "527072230@qq.com")
  )

;; find file
(defun my-config-file()
  (interactive)
  (find-file "~/.spacemacs.d/init.el"))

;; lambda function
(global-set-key (kbd "M-j")
                (lambda ()
                  (interactive)
                  (join-line -1)))

;; align (
(defun my-align-test (s e)
  (interactive "r")
  (align-regexp s e "\\(\\s-*\\)(" 1 1 t))

;; previous window
(global-set-key (kbd "C-<left>")
                (lambda ()
                  (interactive)
                  (other-window -1)))
(global-set-key (kbd "C-<right>")
                (lambda ()
                  (interactive)
                  (other-window 1)))

;; ****************************************************************************
;; Jump to point
;; ****************************************************************************

(global-set-key [(shift f1)] '(lambda ()
                                (interactive)
                                (point-to-register 1)))
(global-set-key [(shift f2)] '(lambda ()
                                (interactive)
                                (point-to-register 2)))
(global-set-key [(shift f3)] '(lambda ()
                                (interactive)
                                (point-to-register 3)))
(global-set-key [(shift f4)] '(lambda ()
                                (interactive)
                                (point-to-register 4)))
(global-set-key [(control f1)] '(lambda ()
                                  (interactive)
                                  (jump-to-register 1)))
(global-set-key [(control f2)] '(lambda ()
                                  (interactive)
                                  (jump-to-register 2)))
(global-set-key [(control f3)] '(lambda ()
                                  (interactive)
                                  (jump-to-register 3)))
(global-set-key [(control f4)] '(lambda ()
                                  (interactive)
                                  (jump-to-register 4)))
