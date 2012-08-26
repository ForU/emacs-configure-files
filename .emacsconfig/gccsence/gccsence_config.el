;; beautiful, great, amazing !!!
(add-to-list 'load-path "~/.emacs.d/plugins/gccsense-0.1/etc")
(require 'gccsense)

(add-hook 'c-mode-common-hook
          (lambda ()
            ;; or (if ac-mode is on)
	    (local-set-key "\M-/" (quote ac-complete-gccsense))))
