;;----------------ECB_LOAD------7 12 2009-------------------------------------------------
(add-to-list 'load-path  "~/.emacs.d/plugins/cedet/ecb-2.40")
 (require 'ecb)            ;load the complete ECB at Emacs-loadtime
 ;(require 'ecb-autoloads) ;load the ECB first after starting it by `ecb-activate'
 (setq ecb-tip-of-the-day nil);load the ecb without the tip
 
;;----------------ecb-options-version-----7 12 2009--------------------------------------
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40"))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

