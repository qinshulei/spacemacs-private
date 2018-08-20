(setq company-english-helper-packages
      '(
        company
        (company-english-helper :location (recipe :fetcher github :repo "manateelazycat/company-english-helper"))
        ))


(defun company-english-helper/init-company-english-helper ()
  (use-package company-english-helper
    :defer t
    :init
    (progn
      (require 'company-english-helper))
    ))
