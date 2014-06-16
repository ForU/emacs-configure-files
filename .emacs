;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ================================================================	   ;;
;; .emacs configure principles:       				       	   ;;
;; 1 extension , myconfig and programconf loads elispfiles	       	   ;;
;; 2 need_load_path is not included in the autoload path(above),   	   ;;
;;   so there is no need to put files in the autoload path to      	   ;;
;;   avoid load files twice.			            	       	   ;;
;; 3 make collections between each other as simple as possible.    	   ;;
;;   (configure dirs) for maintain.			       	           ;;
;; 4 no special theme configure except some common configure for  	   ;;
;;   maintain.                      					   ;;
;; 5 own configure comes last !!!                                          ;;
;; ================================================================	   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; saved on < Wed Apr 20 18:41:12 2011 >
;; xiangshou24@gmail.com
;; 515563130@qq.com
;; ===========================================================================

(mapc   'load (directory-files "~/.emacsconfig/lib"             t "\\.el$"))
(mapc   'load (directory-files "~/.emacsconfig/auto-complete"   t "\\.el$"))
(mapc   'load (directory-files "~/.emacsconfig/cedet"           t "\\.el$"))
;;(mapc 'load (directory-files "~/.emacsconfig/clang"           t "\\.el$"))
(mapc   'load (directory-files "~/.emacsconfig/yasnippet"       t "\\.el$"))
(mapc   'load (directory-files "~/.emacsconfig/org-mode"        t "\\.el$"))
;;(mapc 'load (directory-files "~/.emacsconfig/w3m"             t "\\.el$"))
(mapc   'load (directory-files "~/.emacsconfig/color-theme"     t "\\.el$"))
;;(mapc 'load (directory-files "~/.emacsconfig/company-mode"    t "\\.el$"))
(mapc   'load (directory-files "~/.emacsconfig/emms"            t "\\.el$"))
;;(mapc 'load (directory-files "~/.emacsconfig/gccsence/"       t "\\.el$"))
(mapc   'load (directory-files "~/.emacsconfig/xcscope"         t "\\.el$"))
(mapc   'load (directory-files "~/.emacsconfig/my-programconf"  t "\\.el$"))
(mapc   'load (directory-files "~/.emacsconfig/extension"       t "\\.el$"))
;;(mapc 'load (directory-files "~/.emacsconfig/python/"         t "\\.el$"))
;;(mapc 'load (directory-files "~/.emacsconfig/eim/"            t "\\.el$"))
;;(mapc 'load (directory-files "~/.emacsconfig/slime"           t "\\.el$"))
(mapc   'load (directory-files "~/.emacsconfig/my-own-config"   t "\\.el$"))

;; ===========================================================================
;; configure ends here.
