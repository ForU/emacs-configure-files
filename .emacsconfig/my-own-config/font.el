;; ================================================================
;; FUNCTION: my-font-set*
(defun my-font-set-interactive()
  "interactive"
  (let ((font-name  (intern (completing-read
			     (concat
			      "Give your font name:"
			      " (type ? for list): ")
			     '(
			       ("freemono")
			       ("freemono-bold")
			       ("freemono-small-bold")
			       ("default")
			       ("6x10")
			       ("misc-fixed")
			       ("small-misc-fixed")
			       ("efont16")
				   ("efont14")
			       ("fixed")
			       ("fixed-bold")
			       ("courier")
			       ("courier-bold")
			       ("lucida")
			       ("lucida-large")
			       ("lucida-sans")
			       ("wqy")
			       ("proggy")
			       ("proggy-bp")
			       ("ubuntu")
			       ("ubuntu-bold")
			       ("monaco-small")
			       ("monaco-large")
			       ("panicSans")
			       )
			     nil t))))
    (cond
     ((eq font-name 'freemono)           (set-default-font "freemono-12"))
     ((eq font-name 'freemono-bold)      (set-default-font "freemono-12:bold"))
     ((eq font-name 'freemono-small-bold)(set-default-font "freemono-11:bold"))
     ((eq font-name 'default)            (set-default-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1"))
     ((eq font-name '7x14)               (set-default-font "7x17"))
     ((eq font-name 'misc-fixed)         (set-default-font "-misc-fixed-bold-r-normal--18-120-100-100-c-90-iso10646-1"))
     ((eq font-name 'small-misc-fixed)   (set-default-font "-misc-fixed-medium-r-normal--13-100-100-100-c-80-iso8859-1"))
     ((eq font-name 'efont16)            (set-default-font "-efont-fixed-medium-r-normal-*-16-160-75-75-c-80-iso10646-1"))
     ((eq font-name 'efont14)            (set-default-font "-efont-fixed-medium-r-normal-*-14-140-75-75-c-70-iso10646-1"))
     ((eq font-name 'fixed)              (set-default-font "-misc-fixed-medium-r-normal--15-140-75-75-c-90-iso8859-1"))
     ((eq font-name 'fixed-bold)         (set-default-font "-misc-fixed-bold-r-normal--15-140-75-75-c-90-iso8859-1"))
     ((eq font-name 'courier)            (set-default-font "-adobe-courier-medium-r-normal-*-17-*-*-*-*-*-*"))
     ((eq font-name 'courier-bold)       (set-default-font "-adobe-courier-bold-r-normal-*-17-*-*-*-*-*-*"))
     ((eq font-name 'lucida)             (set-default-font "lucida console-10"))
     ((eq font-name 'lucida-large)       (set-default-font "lucida console"))
     ((eq font-name 'lucida-sans)        (set-default-font "-b&h-Lucida Sans Typewriter-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1"))
     ((eq font-name 'wqy)                (set-default-font "-WenQuanYi-WenQuanYi Bitmap Song-normal-normal-normal-*-15-*-*-*-*-*-iso10646-1"))
     ((eq font-name 'proggy)             (set-default-font "-unknown-ProggyCleanTTSZ-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1"))
     ((eq font-name 'proggy-bp)          (set-default-font "-unknown-ProggyCleanTTSZBP-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1"))
     ((eq font-name 'ubuntu)             (set-default-font "ubuntu Mono-12"))
     ((eq font-name 'ubuntu-bold)        (set-default-font "ubuntu mono-12:bold"))
     ((eq font-name 'monaco-small )      (set-default-font "monaco-10"))
     ((eq font-name 'monaco-large )      (set-default-font "monaco-11")) 
     ((eq font-name 'panicSans )         (set-default-font "panic sans-10:bold"))
     (t(set-default-font "ubuntu mono-12:bold"))
     ))
  )

(defun my-font-set(font-name)
  (interactive "P")
  "set font: can set font interactively or througnt function by given the function a font-name"
  (if (eq font-name nil)
      (my-font-set-interactive)))

;; ================================================================
;; end here.
;; Sun Apr 24 15:23:51 2011
