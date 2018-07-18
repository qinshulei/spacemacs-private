;;; packages.el --- Language Server Protocol functions File for Spacemacs
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Fangrui Song <i@maskray.me>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun spacemacs//lsp-sync-peek-face ()
  "Synchronize the face used in `lsp-ui' peek window according to the theme."
  (set-face-attribute 'lsp-ui-peek-list nil
                      :background (face-attribute 'hl-line :background nil t))
  (set-face-attribute 'lsp-ui-peek-peek nil
                      :background (face-attribute 'hl-line :background nil t))
  (set-face-attribute 'lsp-ui-peek-selection nil
                      :background (face-attribute 'highlight :background nil t)
                      :foreground (face-attribute 'default :foreground nil t))
  (set-face-attribute 'lsp-ui-peek-filename nil
                      :foreground (face-attribute 'font-lock-constant-face
                                                  :foreground nil t))
  (set-face-attribute 'lsp-ui-peek-highlight nil
                      :background (face-attribute 'highlight :background nil t)
                      :foreground (face-attribute 'highlight :foreground nil t)
                      :distant-foreground (face-attribute 'highlight
                                                          :foreground nil t))
  (set-face-attribute 'lsp-ui-peek-header nil
                      :background (face-attribute 'highlight :background nil t)
                      :foreground (face-attribute 'default :foreground nil t))
  )

(defun spacemacs//setup-lsp-jump-handler (&rest modes)
  "Set jump handler for LSP with the given MODE."
  (dolist (m modes)
    (add-to-list (intern (format "spacemacs-jump-handlers-%S" m))
                 '(lsp-ui-peek-find-definitions))))

(defun fix-lsp-company-prefix ()
  "fix lsp-javascript company prefix
https://github.com/emacs-lsp/lsp-javascript/issues/9#issuecomment-379515379"
  (interactive)
  (defun lsp-prefix-company-transformer (candidates)
    (let ((completion-ignore-case t))
      (all-completions (company-grab-symbol) candidates)))
  (make-local-variable 'company-transformers)
  (add-to-list 'company-transformers 'lsp-prefix-company-transformer))


(defun lsp-bash--get-root ()
  (cond
   ((and (bound-and-true-p projectile-mode) (projectile-project-p)) (projectile-project-root))
   ((vc-backend default-directory) (expand-file-name (vc-root-dir)))
   (t (let ((project-types '("config.json" "package.json")))
	      (or (seq-some (lambda (file) (locate-dominating-file default-directory file)) project-types)
            (locate-dominating-file default-directory
                                    (lambda (dir)
                                      (directory-files dir nil "\.sh")))
	          default-directory)))))

(defun lsp-bash--lsp-command ()
  "Generate LSP startup command."
  `("bash-language-server"
    "start"))

(defun lsp-bash--render-string (str)
  "Render STR with `sh-mode' syntax highlighting."
  (ignore-errors
    (with-temp-buffer
      (sh-mode)
      (insert str)
      (font-lock-ensure)
      (buffer-string))))

(defun lsp-bash--initialize-client (client)
  "Initial setup for bash LSP client."
  (lsp-provide-marked-string-renderer
   client "bash" 'lsp-bash--render-string))


(defun spacemacs/bash-setup-lsp ()
  "Setup lsp backend."
  (interactive)
  (progn
    (lsp-bash-enable))
  )
