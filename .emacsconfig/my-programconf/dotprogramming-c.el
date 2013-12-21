;;************************************************
;; dotprogramming-c.el : orginal: rgr-c.el
;;
;; CC++ related utilities
;; Richard Riley.
;; http://richardriley.net/default/projects/emacs/
;;************************************************

;; ################################################################
;; global key binding:
(global-set-key [(shift f6)] 'gdb-restore-windows)
;; actually set error handle to be global
(global-set-key "\C-\M-n" 'next-error)
(global-set-key "\C-\M-n" 'previous-error)

;; ################################################################
;; functions:
(defun my-c-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
                               (?` ?` _ "''")
                               (?\( _ ")")
                               (?\[  _ "]")
                               (?\< "< " _ )
                               (?{ \n > _ \n ?} >)
                               (?\" _ "\"")))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "'") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "<")   'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "\"") 'skeleton-pair-insert-maybe))

(defun make-command()
  (if (or (file-exists-p "makefile") (file-exists-p "Makefile"))
      (progn
        (message "*Makefile found*")
        "make")
    ;; else
    (if  (file-exists-p "SConstruct")
        "scons"
      (let ((file (file-name-nondirectory buffer-file-name)))
        (if (or (equal (file-name-extension buffer-file-name) "cc")
                (equal (file-name-extension buffer-file-name) "c++")
                (equal (file-name-extension buffer-file-name) "cpp"))
            (progn
              (format "%s %s %s -o %s"
                      (or (getenv "CC") "g++")
                      (or (getenv "CPPFLAGS")"-Wall -g2")
                      buffer-file-name
                      (file-name-sans-extension file)
                      ))

          ;; for simple program
          (format "%s -o %s %s %s %s"
                  (or (getenv "CC") "/usr/bin/gcc")
                  (file-name-sans-extension file)
                  (or (getenv "CPPFLAGS")"-DDEBUG=9")
                  (or (getenv "CFLAGS") " -g2 -Wall -Wshadow")
                  file)

          ;; ;; for compiling GTK program
          ;; (format "%s -o %s %s %s %s %s"
          ;; 	    (or (getenv "CC") "gcc")
          ;; 	    (file-name-sans-extension file)
          ;; 	    (or (getenv "GTKFLAGS") "`pkg-config --cflags --libs gtk+-2.0 gmodule-2.0 libglade-2.0`")
          ;; 	    (or (getenv "CPPFLAGS")"-DDEBUG=9")
          ;; 	    (or (getenv "CFLAGS") "-std=c99 -pedantic -Wall -Wshadow -Wpointer-arith -Wcast-qual -Wcast-align -Wwrite-strings -Wconversion  -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wredundant-decls -Wnested-externs -Winline -g")
          ;; 	    file)

          )))))


;; original version
;; (defun do-compile()
;;   (interactive)
;;   ;; (setq compilation-window-height 16)
;;   ;; (setq compilation-scroll-output t)
;;   (setq compilation-finish-functions
;;         (lambda (buf str)
;;           (if (string-match "exited abnormally" str)
;;               ;;there were errors
;;               (message "compilation errors, C-M-n to goto next error.")
;;             ;; else, everything is ok!
;;             (message "No compilation errors!")
;;             (jump-to-buffer "*compilation*")
;;             (delete-window (get-buffer-window "*compilation*"))
;;             (jump-to-terminal "c-term")
;;             )))
;;   (compile (make-command)))


(defun do-compile()
  (interactive)
  ;; (setq compilation-window-height 16)
  ;; (setq compilation-scroll-output t)
  (setq compilation-finish-functions
        (lambda (buf str)
          (if (string-match "exited abnormally" str)
              (message "compilation errors, C-M-n to goto next error.")
            (message "No compilation errors!")
            ;; (delete-compilation-window) ;; in lib.el work wrong
            (jump-to-terminal "term1")
            )))
  (compile (make-command)))

(defun preprocess-command()
  (let ((file (file-name-nondirectory buffer-file-name)))
	(if (or (equal (file-name-extension buffer-file-name) "cc")
            (equal (file-name-extension buffer-file-name) "c++")
            (equal (file-name-extension buffer-file-name) "cpp"))
        (format "%s %s %s -o %s"
                (or (getenv "CC") "g++")
                (or (getenv "CPPFLAGS")"-Wall -Wshadow -E")
                buffer-file-name
                (file-name-sans-extension file)
                )
	  (format "%s -o %s %s %s"
              (or (getenv "CC") "/usr/bin/gcc")
              (file-name-sans-extension file)
              (or (getenv "CFLAGS") "-Wall -Wshadow -E")
              file)
	  )))

(defun do-preprocess()
  (interactive)
  (setq file (file-name-sans-extension (file-name-nondirectory buffer-file-name)))
  (setq compilation-finish-functions (lambda (buf str)
                                       (if (string-match "exited abnormally" str)
                                           ;;there were errors
                                           (message "compilation errors, C-M-n to goto next error.")
                                         ;; else, everything is ok!
                                         (message "No compilation errors! %s %s" buffer-file-name file)
                                         (jump-to-buffer "*compilation*")
                                         (find-file file)
                                         (c-mode)
                                         )))
  (compile (preprocess-command)))


(defun do-lint()
  (interactive)
  (set (make-local-variable 'compile-command)
       (let ((file (file-name-nondirectory buffer-file-name)))
         (format "%s %s %s"
                 "splint"
                 "+single-include -strict -compdef -nullpass -preproc +matchanyintegral -internalglobs -I/usr/include/gtk-2.0/ -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -I/usr/include/cairo/ -I/usr/include/pangomm-1.4/pangomm/"
                 file
                 )))
  (message compile-command)
  (compile compile-command)
  )

(defun do-cdecl ()
  (interactive)
  (shell-command
   (concat "cdecl explain \"" (buffer-substring (region-beginning)
                                                (region-end)) "\""))
  )

;; global keys
(defun my-c-mode-keybinding()
  (interactive)
  ;; compile
  (define-key c-mode-base-map [(f5)] (lambda()(interactive)(do-compile)))
  (define-key c-mode-base-map [(control f5)] (lambda()(interactive)(do-preprocess)))
  ;; debug
  (define-key c-mode-base-map [f6]  'gdb)

  ;; *gud* buffer
  ;; (define-key gud-mode-map "\C-M-p"        'comint-previous-input)
  ;; (define-key gud-mode-map "\C-M-n"        'comint-next-input)
  ;; (define-key gud-mode-map "\M-n"          'gud-next)
  ;; (define-key gud-mode-map "\M-s"          'gud-step)
  ;; (define-key gud-mode-map "\M-f"          'gud-finish)
  ;; (define-key gud-mode-map "\M-w"          'gud-watch)
  ;; (define-key gud-mode-map "\M-p"          'gud-print)
  ;; (define-key gud-mode-map "\M-b"          'gud-break)
  ;; ;; for *breakpoints* buffer
  ;; (define-key gud-mode-map "\M- "          'gdb-toggle-breakpoint)
  ;; (define-key gud-mode-map "\M-d"          'gdb-delete-breakpoint)
  ;; )

  ;; link
  (define-key c-mode-base-map [(shift f7)]    (lambda()(interactive)(do-lint)))
  (define-key c-mode-base-map [(control f7)]  (lambda()(interactive)(do-cdecl)))
  ;; error tracker
  (define-key c-mode-base-map "\C-\M-n" 'next-error)
  (define-key c-mode-base-map "\C-\M-p" 'previous-error)
  ;; specific
  (define-key c-mode-base-map "\C-c\C-t" "\C-a\C- \C-n\M-w\C-y\C-p")
  ;; other tools
  (define-key c-mode-base-map [(f8)]  'ff-find-other-file)
  (define-key c-mode-base-map [(control f8)]  'ff-find-related-file)

  (define-key c-mode-base-map [(control shift f3)]  (lambda()(interactive)(hi-lock-face-buffer "[^. :\tifwhile][A-Za-z0-9_]* ?(" "hi-yellow")))
  ;; cedet, make sure cedet is already loaded
  (define-key c-mode-base-map (kbd "C-M-l") 'semantic-ia-complete-symbol-menu)
  ;; tags
  ;;(local-set-key "\M-l" 'complete-tag)
  )

(defun my-c-mode-common-hook()
  ;; ################
  ;; basic configure
  (c-set-style "stroustrup")
  (c-toggle-auto-hungry-state 1)	; this make auto-newline and hungry-delete
  (which-function-mode t)
  (setq-default indent-tabs-mode nil)
  ;; ################
  ;; debug window
  (setq gdb-show-main t)
  (setq gdb-many-windows t)
  (setq gdb-speedbar-auto-raise nil)

  ;; ################
  ;; company mode
  ;; (company-mode 0)

  ;; ################
  ;; auto fill mode
  (auto-fill-mode 1)
  (setq-default default-fill-column 80)

  ;; ################
  ;; eldoc mode
  ;;(setq c-eldoc-includes "`pkg-config gtk+-2.0 --cflags` -I./ -I../ ")
  ;;(c-turn-on-eldoc-mode)
  ;;(load "c-eldoc")
  ;;(set (make-local-variable 'company-backends) '(company-semantic)) )

  ;; ################
  ;; flyspell mode
  (flyspell-prog-mode)			; just check comment and strings
  )

(defun my-c-mode-cedet-hook ()
  ;; (local-set-key "." 'semantic-complete-self-insert)
  ;; (local-set-key ">" 'semantic-complete-self-insert)
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))

;; ################################################################
(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)
(add-hook 'c-mode-common-hook 'my-c-mode-auto-pair)
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'c-mode-common-hook 'my-c-mode-keybinding)

(provide 'dotprogramming-c)

;; ================================================================
;; end here.
;; Tue Apr 17 10:59:03 2012
