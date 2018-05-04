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


(defun dos2unix ()
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t)
    (replace-match "")
    )
  )

(defun unix2dos ()
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\n" nil t)
    (replace-match "\r\n")
    )
  )

(defun tab-width-2 ()
  "Set tab width to 2"
  (interactive)
  (setq-default tab-width 2))

(defun tab-width-4 ()
  "Set tab width to 4"
  (interactive)
  (setq-default tab-width 4))

(defun tab-width-8 ()
  "Set tab width to 8"
  (interactive)
  (setq-default tab-width 8))

(defun c-offset-2 ()
  "Set the c-basic-offset to 2"
  (interactive)
  (setq c-basic-offset 2))

(defun c-offset-4 ()
  "Set the c-basic-offset to 4"
  (interactive)
  (setq c-basic-offset 4))

(defun c-offset-8 ()
  "Set the c-basic-offset to 8"
  (interactive)
  (setq c-basic-offset 8))

(defun line-cleanup ()
  "Remove all blank lines in region."
  (interactive "*")
  (flush-lines "^$" (point) (mark)))

(defun my-save-and-compile ()
  (interactive "")
  (save-buffer 0)
  (compile "make -k"))

(defun refresh-buffer ()
  "Refresh the current buffer from disk"
  (interactive)
  (revert-buffer t t))


(defun get-filename ()
  "return the filename"
  (interactive)
  (file-name-nondirectory(buffer-file-name)))
(defun get-filename-no-ext ()
  "return the filename"
  (interactive)
  (file-name-sans-extension(file-name-nondirectory(buffer-file-name))))
(defun get-date()
  "Return the current date."
  (interactive)
  (format-time-string "%B %d %Y at %I:%M %p"))
(defun insert-date ()
  "Insert the current date."
  (interactive)
  (insert (get-date)))
(defun insert-filename ()
  "Insert the filename."
  (interactive)
  (insert (get-filename)))
(defun insert-filename-no-ext ()
  "Insert the filename without extension."
  (interactive)
  (insert (get-filename-no-ext)))


(defun cleanup-buffer ()
  (interactive)
  (delete-trailing-whitespace))

(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun beauty-code ()
  "beauty your code"
  (interactive)
  (mark-whole-buffer)
  (tabify)
  (delete-trailing-whitespace))

;; for helm-dash
(defun dash-python-docs ()
  (interactive)
  (setq-local helm-dash-docsets '("Python 2" )))

(defun my-compile ()
  (interactive)
  (compile "make -j4"))


(dolist (hook '(css-mode-hook
                html-mode-hook
                js-mode-hook
                r-mode-hook))
  (add-hook hook 'rainbow-mode))



(defun http_proxy_open ()
  (setq url-proxy-services
        '(("no_proxy" . "^\\(localhost\\|192.*\\)")
          ("http" . "192.168.67.10:3128")
          ("https" . "192.168.67.10:3128")))

  (setq url-http-proxy-basic-auth-storage
        (list (list "192.168.67.10:3128"
                    (cons "Input your LDAP UID !"
                          (base64-encode-string "qinsl0106:QinShuLei6314156")))))
  )
