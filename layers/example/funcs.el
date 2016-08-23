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
