;; url: http://cnsnap.cn.freebsd.org/doc/zh_CN.GB2312/books/developers-handbook/emacs.html
;; Wed Apr 20 21:45:41 2011
;;================================================================
;; FRINGE CONFIGURE
;;

(defun my-fringe-small()
  "toggle the fringe manually"
  (interactive)
  ;(fringe-mode '(8 . 1))
  (setq-default
   indicate-empty-lines t
   indicate-buffer-boundaries '((t . left) (nil . right))))

;;================================================================
(if (window-system)
    (progn
	  ;; fringe init
	  (my-fringe-small)
      ;; http://ubuntuforums.org/showthread.php?t=1530333&highlight=emacs
      (setq-default frame-title-format
					'(:eval
					  (format "%s@%s: %s %s"
							  (or (file-remote-p default-directory 'user)
								  user-real-login-name)
							  (or (file-remote-p default-directory 'host)
								  system-name)
							  (buffer-name)
							  (cond
							   (buffer-file-truename
								(concat "( " buffer-file-truename " )"))
							   (dired-directory
								(concat "{ " dired-directory " }"))
							   (t
								;;"[no file]")))))
								"")))))
      (setq x-select-enable-clipboard  t)
	  ;; SESSION
	  (if (or (equal (getenv "DESKTOP_SESSION") "IceWM")
			  (equal (getenv "DESKTOP_SESSION") "icewm-session"))
		  (progn
			(tool-bar-mode 0)
			(scroll-bar-mode 0)
			(menu-bar-mode 0)
			))
	  (if (or (equal (getenv "DESKTOP_SESSION") "gnome")
			  (equal (getenv "DESKTOP_SESSION") "gnome-classic")
			  (equal (getenv "DESKTOP_SESSION") "default"))
		  (progn
			(maximize-screen)
			(scroll-bar-mode 0)
			(full-screen)
			(set-default-font "lucida console-10")
		        (color-theme-twilight)
			))
	  (if (equal (getenv "DESKTOP_SESSION") "awesome")
		  (progn
			(tool-bar-mode 0)
			(menu-bar-mode 0)
			(scroll-bar-mode 0)
			(my-large-frame)
			(my-font-set "proggy-bp")
			))
	  )
  ;; ================================================================
  ;; else, terminal
  (color-theme-twilight)
  (menu-bar-mode 0)
  (xterm-mouse-mode 1))

;; ================================================================
;; end here.
;; 2012-05-16 xiangshou24@gmail.com
