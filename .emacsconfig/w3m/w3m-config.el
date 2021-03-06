(require 'w3m)
;;(require 'remember)

;; basic


(setq w3m-home-page "74.125.71.102")

(setq w3m-icon-directory "/usr/share/pixmaps/w3m-el")
(setq browse-url-browser-function
      '(("blogs.tap.ibm.com" . w3m-browse-url)
        ("ibm.com" . browse-url-firefox)
        ("." . w3m-browse-url)))
(global-set-key "\C-xm" 'browse-url-at-point)

(defun sacha/toggle-w3m ()
  (interactive)
  (let ((list (buffer-list))
        found
        (from-w3m (equal major-mode 'w3m-mode)))
    (while list
      (when (with-current-buffer (car list)
              (if from-w3m
                  (not (equal major-mode 'w3m-mode))
                (equal major-mode 'w3m-mode)))
        (setq found (car list))
        (pop-to-buffer (car list))
        (setq list nil))
      (setq list (cdr list)))
    (unless (or from-w3m found)
      (call-interactively 'w3m))))

;; http://www.mit.edu/afs/sipb/contrib/emacs/packages/w3m_el-1.2.8/w3m-filter.el
(defun sacha/w3m-filter-google (url &rest ignore)
  "Add <LINK> tag to search results of www.google.com."
  (goto-char (point-max))
  (let ((next (when (re-search-backward
                     "<a href=\\([^>]+\\)><img src=/\\(intl/[^/]+/\\)?nav_next.gif"
                     nil t)
                (match-string 1)))
        (prev (when (re-search-backward
                     "<a href=\\([^>]+\\)><img src=/\\(intl/[^/]+/\\)?nav_previous.gif"
                     nil t)
                (match-string 1))))
    (goto-char (point-min))
    (when (search-forward "<head>" nil t)
      (when prev (insert "\n<link rel=\"prev\" href=\"" prev "\">"))
      (when next (insert "\n<link rel=\"next\" href=\"" next "\">")))
    t))

(defun sacha/w3m-filter-clientcopia (url &rest ignore)
  "Add <LINK> tag to search results of www.clientcopia.com."
  (goto-char (point-max))
  (let* ((next (when (re-search-backward
		      "\\(quotes.php.id=[0-9]+\\).*NEXT"
		      nil t)
		 (match-string 1)))
         (prev (when (re-search-backward
		      "<a href=\\(quotes.php.id=[0-9]+\\).*BACK"
		      nil t)
		 (match-string 1))))
    (goto-char (point-min))
    (when (search-forward "<head>" nil t)
      (when prev (insert "\n<link rel=\"prev\" href=\"" prev "\">"))
      (when next (insert "\n<link rel=\"next\" href=\"" next "\">")))
    t))

;; Guessed
(defun w3m-filter-find-relationships (url next previous)
  "Add <LINK> tags if they don't yet exist."
  (let ((case-fold-search t))
    (goto-char (point-max))
    (when (re-search-backward next nil t)
      (when (re-search-backward "href=\"?\\([^\" \t\n]+\\)" nil t)
        (setq w3m-next-url (match-string 1))))
    (when (re-search-backward previous nil t)
      (when (re-search-backward "href=\"?\\([^\" \t\n]+\\)" nil t)
        (setq w3m-previous-url (match-string 1))))))

(defun w3m-download-with-wget ()
  (interactive)
  (let ((url (or (w3m-anchor) (w3m-image))))
    (if url
        (let ((proc (start-process "wget" (format "*wget %s*" url)
                                   "wget" "-x" "--passive-ftp" "-nv"
                                   "-P" "/home/sacha/notebook/mirrors" url)))
          (with-current-buffer (process-buffer proc)
            (erase-buffer))
          (set-process-sentinel proc (lambda (proc str)
                                       (message "wget download done"))))
      (message "Nothing to get"))))

(autoload 'w3m "w3m" "Visit the WWW page using w3m" t)
(autoload 'w3m-find-file "w3m" "Find a local file using emacs-w3m." t)
(autoload 'w3m-browse-url "w3m" "Ask emacs-w3m to show a URL." t)
(autoload 'w3m-antenna "w3m-antenna" "Report changes of web sites." t)
(autoload 'w3m-bookmark-view "w3m-bookmark" "Show bookmarks." t)
(autoload 'w3m-dtree "w3m-dtree" "Display a directory tree." t)
(autoload 'w3m-namazu "w3m-namazu" "Search files with Namazu." t)
(autoload 'w3m-perldoc "w3m-perldoc" "View Perl documents" t)
(autoload 'w3m-search "w3m-search" "Search words using emacs-w3m." t)
(autoload 'w3m-weather "w3m-weather" "Display a weather report." t)

(defvar sacha/w3m-mirror-directory nil "*Directory where my files are mirrored.")

(defun sacha/w3m-mirror-current-page (url &optional recursive)
  "Download specified URL to my mirrors directory.
If called interactively, mirrors current page.
If prefix argument RECURSIVE is non-nil, recurse into subdirectories."
  (interactive (list w3m-current-url current-prefix-arg))
  (with-temp-buffer
    (message "Getting %s" url)
    (cd sacha/w3m-mirror-directory)
    (apply 'start-process "wget"
           (format "*wget %s*" w3m-current-url)
           "wget"
           "-nv" ; non-verbose
           "-x"
           "--random-wait"
           "-k"
           "-p"
           url
           (if recursive
               (list "-r" "--no-parent" "-N" "-nw")))))

(defun sacha/w3m-mirror-link (recursive)
  "Mirror current link.
If prefix argument RECURSIVE is non-nil, recurse into subdirectories."
  (interactive "P")
  (sacha/w3m-mirror-current-page (w3m-anchor) recursive))

(defun sacha/w3m-rename-buffer (url)
  "Suitable for adding to `w3m-display-hook'."
  (rename-buffer (format "*w3m %s (%s)*"
                         (or w3m-current-title "")
                         (or w3m-current-url "")) t))
(add-hook 'w3m-display-hook 'sacha/w3m-rename-buffer)

;; From http://www.emacswiki.org/cgi-bin/wiki/WThreeMDelicious
(defun sacha/delicious-url ()
  "Bookmark this page with del.icio.us."
  (interactive)
  (w3m-goto-url
   (concat "http://del.icio.us/sachac?"
           "url="    (w3m-url-encode-string w3m-current-url)
           "&title=" (w3m-url-encode-string w3m-current-title))))

(defadvice w3m-browse-url (around sacha activate)
  "Always start a new session."
  (ad-set-arg 1 t)
  ad-do-it)

(defadvice switch-to-buffer (after sacha activate)
  "Update w3m tabs."
  (when (and (interactive-p)
             (eq major-mode 'w3m-mode)
             header-line-format)
    (w3m-force-window-update)))

(defadvice switch-to-buffer-other-window (after sacha activate)
  "Update w3m tabs."
  (when (and (interactive-p)
             (eq major-mode 'w3m-mode)
             header-line-format)
    (w3m-force-window-update)))

(defun sacha/w3m-setup-keymap ()
  "Use my heavily customized map."
  (interactive)
  ;; Undefine this key and use the advice instead so that my ido doesn't get
  ;; overridden
  (define-key w3m-mode-map (kbd "C-x b") nil)
  (define-key w3m-mode-map "C" 'w3m-print-this-url)
  (define-key w3m-mode-map "a" 'sacha/delicious-url)
  (define-key w3m-mode-map "A" 'w3m-bookmark-add-current-url)
  (define-key w3m-mode-map "w" 'w3m-download-with-wget)
  (define-key w3m-mode-map "d" 'w3m-download-with-wget)
  (define-key w3m-mode-map "D" 'w3m-download-this-url)
  ;; Do not override my ever so handy ERC binding
  (define-key w3m-mode-map (kbd "C-c C-SPC") nil)
  (define-key w3m-mode-map "m" 'sacha/w3m-mirror-current-page)
  (define-key w3m-mode-map "M" 'sacha/w3m-mirror-link)
  ;; I use search much more often than the context history list, although
  ;; context is still cool. 
  (define-key w3m-mode-map "!" 'sacha/w3m-mirror-current-page)
  (define-key w3m-mode-map "s" 'w3m-search)
  (define-key w3m-mode-map "h" 'w3m-history)
  (define-key w3m-mode-map "t" 'w3m-scroll-down-or-previous-url)
  (define-key w3m-mode-map "n" 'w3m-scroll-up-or-next-url)
  ;; I don't often w3m to edit pages, so I'm borrowing o and e (right
  ;; below , / . for tab navigation) for page navigation instead.
  (define-key w3m-mode-map "o" 'w3m-view-previous-page)
  (define-key w3m-mode-map "e" 'w3m-view-next-page)
  ;; i is a more useful mnemonic for toggling images
  (define-key w3m-mode-map "i" 'w3m-toggle-inline-image)
  (define-key w3m-mode-map "I" 'w3m-toggle-inline-images)
  ;; and X for closing the buffer
  (define-key w3m-mode-map "X" 'w3m-delete-buffer)
  (define-key w3m-mode-map "x" 'w3m-delete-buffer)
  (define-key w3m-mode-map "z" 'w3m-delete-buffer)
  ;; and b for bookmarks
  (define-key w3m-mode-map "b" 'w3m-bookmark-view)
  ;; I don't use the Qwerty keymap, so hjkl is useless for me
  ;; I'll use HTNS, though
  (define-key w3m-mode-map "H" 'backward-char)
  (define-key w3m-mode-map "T" 'previous-line)
  (define-key w3m-mode-map "N" 'next-line)
  (define-key w3m-mode-map "S" 'forward-char)
  ;; Browse in new sessions by default
  (define-key w3m-mode-map (kbd "RET") 'w3m-view-this-url-new-session)
  (define-key w3m-mode-map [(shift return)] 'w3m-view-this-url)
  (define-key w3m-mode-map "g" 'w3m-goto-url)
  (define-key w3m-mode-map "G" 'w3m-goto-url-new-session)
  ;; f for forward? I want to be able to follow links without removing
  ;; most of my fingers from home row. My fingers are too short to hit
  ;; Enter.
  (define-key w3m-mode-map "f" 'w3m-view-this-url-new-session)
  (define-key w3m-mode-map "F" 'w3m-view-this-url)
  ;; Use cursor keys to scroll
  (define-key w3m-mode-map [(left)] 'backward-char)
  (define-key w3m-mode-map [(right)] 'forward-char)
  (define-key w3m-mode-map [(shift left)] 'w3m-shift-right)
  (define-key w3m-mode-map [(shift right)] 'w3m-shift-left)
  ;; Which means I can now use , and . to switch pages
  (define-key w3m-mode-map "." 'w3m-next-buffer)
  (define-key w3m-mode-map "," 'w3m-previous-buffer)
  ;; IBM stuff
  (define-key w3m-mode-map "i" nil)
  (define-key w3m-mode-map "ib" 'sacha/ibm-blog)
  (define-key w3m-mode-map "id" 'sacha/dogear-url)
  (define-key w3m-mode-map "f" 'sacha/w3m-open-in-firefox)

  )

;; I don't really redisplay stuff; I can use refresh for that
;; (define-key w3m-mode-map "r" 'remember))

(setq w3m-keep-arrived-urls 5000)
(add-hook 'w3m-mode-hook 'sacha/w3m-setup-keymap)
(sacha/w3m-setup-keymap)

(defun sacha/w3m-open-in-firefox ()
  (interactive)
  (browse-url-firefox w3m-current-url))


(defadvice browse-url (around sacha activate)
  (if current-prefix-arg
      (save-window-excursion
        ad-do-it)
    ad-do-it))

;; Focus on new tabs
					;(setq w3m-view-this-url-new-session-in-background nil)


;;_+ quick searches


;; Don't know if it's the best way , but it seemed to work. (Requires emacs >= 20)
(defun browse-apropos-url (text &optional new-window)
  (interactive (browse-url-interactive-arg "Location: "))
  (let ((text (replace-regexp-in-string 
               "^ *\\| *$" "" 
               (replace-regexp-in-string "[ \t\n]+" " " text)))
        ___braplast)
    (let ((url (or (assoc-if
                    (lambda (a) (string-match a text))
                    apropos-url-alist)
                   text)))
      (browse-url (replace-regexp-in-string (car url) (cdr url) text) new-window))))

(setq apropos-url-alist
      '(("^gw?:? +\\(.*\\)" . ;; Google Web 
         "http://www.google.com/search?q=\\1")

        ("^g!:? +\\(.*\\)" . ;; Google Lucky
         "http://www.google.com/search?btnI=I%27m+Feeling+Lucky&q=\\1")
        
        ("^gl:? +\\(.*\\)" .  ;; Google Linux 
         "http://www.google.com/linux?q=\\1")
        
        ("^gi:? +\\(.*\\)" . ;; Google Images
         "http://images.google.com/images?sa=N&tab=wi&q=\\1")

        ("^gg:? +\\(.*\\)" . ;; Google Groups
         "http://groups.google.com/groups?q=\\1")

        ("^gd:? +\\(.*\\)" . ;; Google Directory
         "http://www.google.com/search?&sa=N&cat=gwd/Top&tab=gd&q=\\1")

        ("^gn:? +\\(.*\\)" . ;; Google News
         "http://news.google.com/news?sa=N&tab=dn&q=\\1")

        ("^gt:? +\\(\\w+\\)|? *\\(\\w+\\) +\\(\\w+://.*\\)" . ;; Google Translate URL
         "http://translate.google.com/translate?langpair=\\1|\\2&u=\\3")
        
        ("^gt:? +\\(\\w+\\)|? *\\(\\w+\\) +\\(.*\\)" . ;; Google Translate Text
         "http://translate.google.com/translate_t?langpair=\\1|\\2&text=\\3")

        ("^/\\.$" . ;; Slashdot 
         "http://www.slashdot.org")

        ("^/\\.:? +\\(.*\\)" . ;; Slashdot search
         "http://www.osdn.com/osdnsearch.pl?site=Slashdot&query=\\1")        
        
        ("^fm$" . ;; Freshmeat
         "http://www.freshmeat.net")

        ("^ewiki:? *?\\(.*\\)" . ;; Emacs Wiki Search
         "http://www.emacswiki.org/cgi-bin/wiki?search=\\1")
	
        ("^ewiki$" . ;; Emacs Wiki 
         "http://www.emacswiki.org")

        ("^arda$" . ;; The Encyclopedia of Arda 
         "http://www.glyphweb.com/arda/")
	
	))
(provide 'w3m-config)
