(defun qinshulei/post-init-expand-region ()
  (global-set-key (kbd "C-=") 'er/expand-region)
  )

(defun qinshulei/post-init-avy ()
  (global-set-key (kbd "C-;") 'avy-goto-word-or-subword-1))


(global-set-key (kbd "C-c j") 'join-line)
(global-set-key (kbd "C-c J") (lambda () (interactive) (join-line 1)))

(global-set-key (kbd "C-.") 'set-mark-command)
(global-set-key (kbd "C-x C-.") 'pop-global-mark)

(defun kill-back-to-indentation ()
  "Kill from point back to the first non-whitespace character on the line."
  (interactive)
  (let ((prev-pos (point)))
    (back-to-indentation)
    (kill-region (point) prev-pos)))

(global-set-key (kbd "C-M-<backspace>") 'kill-back-to-indentation)


;; in isearch mode

;; Activate occur easily inside isearch
(define-key isearch-mode-map (kbd "C-o") 'isearch-occur)
;; DEL during isearch should edit the search string, not jump back to the previous result
(define-key isearch-mode-map [remap isearch-delete-char] 'isearch-del-char)
(define-key isearch-mode-map [(control return)] 'isearch-exit-other-end)
