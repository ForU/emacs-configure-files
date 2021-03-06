;; ================================================================
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Fonts.html
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
                               ("default-apple")
                               ("default-large")
                               ("default")
                               ("6x10")
                               ("misc-fixed")
                               ("small-misc-fixed")
                               ("efont16")
                               ("efont14")
                               ("fixed")
                               ("fixed-bold")
                               ("consolas")
                               ("consolas-large")
                               ("courier")
                               ("courier-bold")
                               ("lucida")
                               ("lucida-11")
                               ("lucida-apple")
                               ("wqy")
                               ("proggy")
                               ("proggy-bp")
                               ("ubuntu")
                               ("ubuntu-bold")
                               ("monaco-apple")
                               ("monaco-small")
                               ("monaco-large")
                               ("monaco")
                               ("panicSans")
                               ("apple")
                               ("terminus-bold")
                               ("terminus")
                               ("scp")
                               )
                             nil t))))

    (cond
     ((eq font-name 'freemono)            (set-default-font "freemono-12"))
     ((eq font-name 'freemono-bold)       (set-default-font "freemono-12:bold"))
     ((eq font-name 'freemono-small-bold) (set-default-font "freemono-11:bold"))
     ((eq font-name 'default-apple)       (set-default-font "-*-Menlo-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1"))
     ((eq font-name 'default-large)       (set-default-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1"))
     ((eq font-name 'default)             (set-default-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-13-*-*-*-m-0-iso10646-1"))
     ((eq font-name '7x14)                (set-default-font "7x17"))
     ((eq font-name 'misc-fixed)          (set-default-font "-misc-fixed-bold-r-normal--18-120-100-100-c-90-iso10646-1"))
     ((eq font-name 'small-misc-fixed)    (set-default-font "-misc-fixed-medium-r-normal--13-100-100-100-c-80-iso8859-1"))
     ((eq font-name 'efont16)             (set-default-font "-efont-fixed-medium-r-normal-*-16-160-75-75-c-80-iso10646-1"))
     ((eq font-name 'efont14)             (set-default-font "-efont-fixed-medium-r-normal-*-14-140-75-75-c-70-iso10646-1"))
     ((eq font-name 'fixed)               (set-default-font "-misc-fixed-medium-r-normal--15-140-75-75-c-90-iso8859-1"))
     ((eq font-name 'fixed-bold)          (set-default-font "-misc-fixed-bold-r-normal--15-140-75-75-c-90-iso8859-1"))
     ((eq font-name 'consolas)            (set-default-font "-microsoft-Consolas-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1"))
     ((eq font-name 'consolas-large)      (set-default-font"-microsoft-Consolas-normal-normal-normal-*-20-*-*-*-m-0-iso10646-1"))
     ((eq font-name 'courier)             (set-default-font "-*-Courier New-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1"))
     ((eq font-name 'courier-bold)        (set-default-font "-*-Courier New-bold-normal-normal-*-15-*-*-*-m-0-iso10646-1"))
     ((eq font-name 'lucida)              (set-default-font "lucida console-10"))
     ((eq font-name 'lucida-11)           (set-default-font "lucida console-11"))
     ((eq font-name 'lucida-apple)           (set-default-font "lucida console-14"))
     ((eq font-name 'wqy)                 (set-default-font "-WenQuanYi-WenQuanYi Bitmap Song-normal-normal-normal-*-15-*-*-*-*-*-iso10646-1"))
     ((eq font-name 'proggy)              (set-default-font "-unknown-ProggyCleanTTSZ-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1"))
     ((eq font-name 'proggy-bp)           (set-default-font "-unknown-ProggyCleanTTSZBP-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1"))
     ((eq font-name 'ubuntu)              (set-default-font "ubuntu Mono-12"))
     ((eq font-name 'ubuntu-bold)         (set-default-font "ubuntu mono-12:bold"))
     ((eq font-name 'monaco-small )       (set-default-font "monaco-10"))
     ((eq font-name 'monaco-apple)        (set-default-font "-apple-Monaco-medium-normal-normal-*-14-*-*-*-m-0-iso10646-1"))
     ((eq font-name 'monaco )             (set-default-font "-apple-Monaco-medium-normal-normal-*-14-*-*-*-m-0-iso10646-1"))
     ((eq font-name 'monaco-large )       (set-default-font "monaco-11"))
     ((eq font-name 'panicSans )          (set-default-font "panic sans-10:bold"))
     ((eq font-name 'apple)               (set-default-font "-unknown-AquaBase-normal-normal-normal-*-15-*-*-*-*-0-iso10646-1"))
     ((eq font-name 'terminus-bold)       (set-default-font "-xos4-Terminus-bold-normal-normal-*-16-*-*-*-c-80-iso10646-1"))
     ((eq font-name 'terminus)            (set-default-font "-xos4-Terminus-normal-normal-normal-*-16-*-*-*-c-80-iso10646-1"))
     ((eq font-name 'scp)                 (set-default-font "source code pro-14:weight=light"))
     (t(set-default-font "lucida console-11"))

     ))
  )

(defun my-font-set(font-name)
  (interactive "P")
  "set font: can set font interactively or througnt function by given the function a font-name"
  (if (eq font-name nil)
      (my-font-set-interactive)))

; (set-default-font "-apple-Monaco-medium-normal-normal-*-14-*-*-*-m-0-iso10646-1")

;; ================================================================
;; end here.
;; Sun Apr 24 15:23:51 2011
