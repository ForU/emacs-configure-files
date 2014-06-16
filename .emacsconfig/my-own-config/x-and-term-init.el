;; url: http://cnsnap.cn.freebsd.org/doc/zh_CN.GB2312/books/developers-handbook/emacs.html
;; Wed Apr 20 21:45:41 2011
(defun my-fringe-small()
  "toggle the fringe manually"
  (interactive)
  (fringe-mode '(8 . 0)))

(if (window-system)
    (progn
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
	  (if (or(equal (getenv "DESKTOP_SESSION") "icewm")
             (equal (getenv "DESKTOP_SESSION") "IceWM")
             (equal (getenv "DESKTOP_SESSION") "icewm-session"))
		  (progn
			(tool-bar-mode 0)
			(menu-bar-mode 0)
			;; (scroll-bar-mode 0)
            ;; (set-default-font "monaco-11")
			))
	  (if (or (equal (getenv "DESKTOP_SESSION") "gnome")
			  (equal (getenv "DESKTOP_SESSION") "gnome-classic")
			  (equal (getenv "DESKTOP_SESSION") "ubuntu"))
		  (progn
			;; (scroll-bar-mode 0)
            (menu-bar-mode 0)
            (tool-bar-mode 0)
			(my-fringe-small)
			)
		)
	  ;; else, none of above
	  (menu-bar-mode 0)
	  (tool-bar-mode 0)
	  (my-fringe-small)
	  )
  ;; ================================================================
  ;; else, terminal
  (menu-bar-mode 0)
  (xterm-mouse-mode 1))

;; always
(scroll-bar-mode 0)

;; ================================================================
;; end here.
;; 2012-05-16 xiangshou24@gmail.com
