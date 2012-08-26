(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-sources (quote (ac-source-abbrev ac-source-words-in-buffer ac-source-files-in-current-dir ac-source-filename)) t)
 '(comint-completion-addsuffix t)
 '(comint-completion-autolist t)
 '(comint-input-ignoredups t)
 '(comint-scroll-show-maximum-output t)
 '(comint-scroll-to-bottom-on-input t)
 '(comint-scroll-to-bottom-on-output t)
 '(ecb-layout-window-sizes (quote (("left8" (0.1696969696969697 . 0.26785714285714285) (0.1696969696969697 . 0.23214285714285715) (0.1696969696969697 . 0.26785714285714285) (0.1696969696969697 . 0.21428571428571427)))))
 '(ecb-options-version "2.40"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(defun my-ecb-config()
  (interactive)
  (ecb-change-layout 'left3)
  )

(add-hook 'ecb-activate-before-layout-draw-hook 'my-ecb-config)
