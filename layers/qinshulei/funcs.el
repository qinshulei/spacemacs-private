;; Search back/forth for the symbol at point
;; See http://www.emacswiki.org/emacs/SearchAtPoint
(defun isearch-yank-symbol ()
  "*Put symbol at current point into search string."
  (interactive)
  (let ((sym (symbol-at-point)))
    (if sym
        (progn
          (setq isearch-regexp t
                isearch-string (concat "\\_<" (regexp-quote (symbol-name sym)) "\\_>")
                isearch-message (mapconcat 'isearch-text-char-description isearch-string "")
                isearch-yank-flag t))
      (ding)))
  (isearch-search-and-update))

(define-key isearch-mode-map "\C-\M-w" 'isearch-yank-symbol)


;; http://www.emacswiki.org/emacs/ZapToISearch
(defun zap-to-isearch (rbeg rend)
  "Kill the region between the mark and the closest portion of
the isearch match string. The behaviour is meant to be analogous
to zap-to-char; let's call it zap-to-isearch. The deleted region
does not include the isearch word. This is meant to be bound only
in isearch mode.  The point of this function is that oftentimes
you want to delete some portion of text, one end of which happens
to be an active isearch word. The observation to make is that if
you use isearch a lot to move the cursor around (as you should,
it is much more efficient than using the arrows), it happens a
lot that you could just delete the active region between the mark
and the point, not include the isearch word."
  (interactive "r")
  (when (not mark-active)
    (error "Mark is not active"))
  (let* ((isearch-bounds (list isearch-other-end (point)))
         (ismin (apply 'min isearch-bounds))
         (ismax (apply 'max isearch-bounds))
         )
    (if (< (mark) ismin)
        (kill-region (mark) ismin)
      (if (> (mark) ismax)
          (kill-region ismax (mark))
        (error "Internal error in isearch kill function.")))
    (isearch-exit)
    ))

(define-key isearch-mode-map [(meta z)] 'zap-to-isearch)


;; http://www.emacswiki.org/emacs/ZapToISearch
(defun isearch-exit-other-end (rbeg rend)
  "Exit isearch, but at the other end of the search string.
This is useful when followed by an immediate kill."
  (interactive "r")
  (isearch-exit)
  (goto-char isearch-other-end))

;;;insert time function
(defun insert-date ()
  "Insert current date yyyy-mm-dd."
  (interactive)
  (when (region-active-p)
    (delete-region (region-beginning) (region-end) ))
  (insert (format-time-string "%Y-%m-%d %H:%M:%S")))

;;binder insert date to key c-x t
(global-set-key (kbd "C-x t") 'insert-date)

;; kill all buffers
(defun kill-all-buffers ()
  "kill all buffers"
  (interactive)
  (mapcar (lambda (x) (kill-buffer x))
          (buffer-list))
  (delete-other-windows))

;; set helm dash
(defun dash-python-docs ()
  (interactive)
  (setq-local helm-dash-docsets '("Python 2")))

(defun dash-bash-docs ()
  (interactive)
  (setq-local helm-dash-docsets '("Bash")))

(defun dash-web-docs ()
  (interactive)
  (setq-local helm-dash-docsets '("HTML" "CSS" "Bootstrap 3" "JavaScript" "jQuery" "Emmet")))

(defun dash-css-docs ()
  (interactive)
  (setq-local helm-dash-docsets '("CSS" "Emmet")))

(defun dash-javascript-docs ()
  (interactive)
  (setq-local helm-dash-docsets '("JavaScript" "jQuery" "Emmet")))

(defun dash-java-docs ()
  (interactive)
  (setq-local helm-dash-docsets '("Java")))

(defun dash-elisp-docs ()
  (interactive)
  (setq-local helm-dash-docsets '("Emacs Lisp")))
