;; ;;================================================================
;; ;;slime-auto-load:
;; (add-to-list 'load-path "~/.emacs.d/plugins/slime-2009-07-10/")  ; your SLIME directory
;;     (setq inferior-lisp-program "/usr/local/bin/sbcl") ; your Lisp system
;;     (require 'slime)
;;     (slime-setup)

;;================================================================
;;load-slime-if-need:
;;http://common-lisp.net/project/slime/doc/html/Autoloading.html#Autoloading
(add-to-list 'load-path "~/.emacs.d/plugins/slime-2011-01-18/")

(setq inferior-lisp-program "/usr/bin/sbcl")
(require 'slime-autoloads)
(slime-setup)


