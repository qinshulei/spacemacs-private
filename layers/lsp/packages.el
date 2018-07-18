(setq lsp-packages
      '(
        (company-lsp :requires company)
	      lsp-mode
        lsp-ui
        lsp-imenu
        sh-script
        projectile
        ))

(defun lsp/init-lsp-mode ()
  (use-package lsp-mode
    :defer t
    :config
    (progn
      (spacemacs|hide-lighter lsp-mode)
      (setq lsp-message-project-root-warning t))))

(defun lsp/init-lsp-imenu ()
  (use-package lsp-imenu
    :after lsp-mode
    :hook
    ((lsp-after-open . lsp-enable-imenu))
    )
  )

(defun lsp/init-lsp-ui ()
  (use-package lsp-ui
    :defer t
    :after lsp-mode yasnippet
    :bind (:map lsp-ui-mode-map
                ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
                ([remap xref-find-references]  . lsp-ui-peek-find-references))
    :hook    ((lsp-mode . lsp-ui-mode))
    :config
    (progn
      (spacemacs//lsp-sync-peek-face)
      (setq lsp-ui-doc-position 'bottom
            lsp-ui-doc-include-signature t)
      (add-hook 'spacemacs-post-theme-change-hook
                #'spacemacs//lsp-sync-peek-face)
      (add-hook 'lsp-after-open-hook        ; flycheck
                #'(lambda () (lsp-ui-flycheck-enable 1)))
      (yas-minor-mode)                      ; yasnippet
      ;; redefine the function in lsp-ui-doc
      ;; may need to sync the content with the latest version of lsp-ui-doc.el
      (defun lsp-ui-doc--setup-markdown (mode)
                      "Setup the ‘markdown-mode’ in the frame. MODE is the mode used in the parent frame."
                      (make-local-variable 'markdown-code-lang-modes)
                      (dolist (mark (alist-get mode lsp-ui-doc-custom-markup-modes))
                        (add-to-list 'markdown-code-lang-modes (cons mark mode)))
                      (setq-local markdown-fontify-code-blocks-natively nil)
                      (setq-local markdown-fontify-code-block-default-mode mode)
                      (setq-local markdown-hide-markup t)

                                        ; lsp-ui-doc is using (markdown-view-mode)
                                        ; ignore rendering code block for background and text style in order to prevent hard to read rendered texts
                      (set-face-attribute 'markdown-code-face nil
                                          :inherit 'default
                                          :background nil)
                      )
      )))

(defun lsp/init-lsp-ui ()
  (use-package lsp-ui
    :init (add-hook 'lsp-mode-hook 'lsp-ui-mode)))

(defun lsp/init-company-lsp ()
  (use-package company-lsp
    :defer t
    :init
    ;; Language servers have better idea filtering and sorting,
    ;; don't filter results on the client side.
    (setq company-transformers nil
          company-lsp-async t
          company-lsp-cache-candidates nil)
    ))

(defun lsp/post-init-company-lsp ()
  "call lsp-bash-enable"
  (use-package company-lsp
    :after lsp-mode company
    :init
    (push 'company-lsp company-backends)
    :defer t
    :config
    (progn
      (setq company-lsp-enable-recompletion t)
      (lsp-define-stdio-client
       lsp-bash "bash"
       #'lsp-bash--get-root
       nil
       :initialize 'lsp-bash--initialize-client
       :command-fn 'lsp-bash--lsp-command)
      )))
