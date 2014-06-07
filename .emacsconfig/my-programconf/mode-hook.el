;; ================================================================
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'reftex-mode)
(add-hook 'diary-hook 'appt-make-list)

(defun my-LaTeX-mode-hook()
  (auto-fill-mode 0)
  (auto-complete-mode 1)
  (local-set-key (kbd "<f5>") 'compile)
)
(add-hook 'LaTeX-mode-hook 'my-LaTeX-mode-hook)

;; ================================================================
;; shell script mode
(defun my-sh-mode-hook ()
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
							   (?` ?` _ "''")
							   (?\( _ ")")
							   (?\[  _ " ]")
							   ;;(?\< _ ">")
							   (?{ _ "}")
							   (?\" _ "\"")))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "'") 'skeleton-pair-insert-maybe)
  ;;(local-set-key (kbd "<")   'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "<f5>")
				 (lambda ()
				   (interactive)
				   (local-set-key [(f5)] (jump-to-terminal "shell-term")))))
(add-hook 'sh-mode-hook 'my-sh-mode-hook)

;; ================================================================
;; js mode
(defun my-js-mode-hook ()
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
							   (?` ?` _ "''")
							   (?\( _ ")")
							   (?\[  _ " ]")
							   ;;(?\< _ ">")
                               (?{ \n > _ \n ?} >)
							   (?\" _ "\"")))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "'") 'skeleton-pair-insert-maybe)
  ;;(local-set-key (kbd "<")   'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "\"") 'skeleton-pair-insert-maybe))

(add-hook 'js-mode-hook 'my-js-mode-hook)

;; ================================================================
;; python
(defun my-python-mode-hook()
  (local-set-key (kbd "<f5>")
				 (lambda ()
				   (interactive)
				   (local-set-key [(f5)] (jump-to-terminal "python-term")))))

(defun my-python-mode-hook1 ()
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
							   (?` ?` _ "''")
							   (?\( _ ")")
							   (?\[  _ "]")
							   ;;(?\< _ ">")
							   (?{ _ "}")
							   (?\" _ "\"")))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "'") 'skeleton-pair-insert-maybe)
  ;;(local-set-key (kbd "<")   'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "<f5>")
				 (lambda ()
				   (interactive)
				   (local-set-key [(f5)] (jump-to-terminal "shell-term")))))
(add-hook 'python-mode-hook 'my-python-mode-hook)
(add-hook 'python-mode-hook 'my-python-mode-hook1)

;; ================================================================
;; perl script mode
(defun my-perl-mode-hook()
  ;; do something here
  (local-set-key (kbd "<f5>")
				 (lambda ()
				   (interactive)
				   (local-set-key [(f5)] (jump-to-terminal "perl-term")))))

(add-hook 'perl-mode-hook 'my-perl-mode-hook)

;; ================================================================
;; emacs lisp mode or lisp interaction mode
(defun my-elisp-mode-hook ()
  (setq debug-on-error t)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
							   (?` ?` _ "''")
							   (?\( _ ")")
							   (?\[  _ "]")
							   (?\< _ ">")
							   (?{ _ ?})
							   (?\" _ "\"")))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "'") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "<") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "\"")'skeleton-pair-insert-maybe)
  (local-set-key "\C-j"    'reindent-then-newline-and-indent)
  (local-set-key (kbd "<f5>")
				 (lambda()
				   (interactive)
				   (eval-buffer)
				   (message "eval-buffer Done !"))))
(dolist (hook (list
			   'emacs-lisp-mode-hook
			   'lisp-interaction-mode
			   'elisp-mode-common-hook
			   ))
  (add-hook hook 'my-elisp-mode-hook))

;; ================================================================
(defun my-text-mode-hook ()
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
							   (?` ?` _ "''")
							   (?\( _ ")")
							   (?\[  _ "]")
							   (?\< _ ">")
							   (?{ _ ?})
							   (?\" _ "\"")))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "'") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "<")   'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "\"") 'skeleton-pair-insert-maybe)

  ;; (local-set-key (kbd "<tab>")
  ;;   (lambda ()
  ;;     (interactive)
  ;;     (if (string= "text-mode" major-mode)
  ;;         (insert "    "))))
  )

(dolist (hook (list
			   'text-mode-hook
			   'org-mode-hook
			   'sql-mode-hook
			   'outline-mode-hook 
			   ))
  (add-hook hook 'my-text-mode-hook))

;; ================================================================
;; buffer menu mode:
(defun my-buffer-menu-mode-hook()
  (hl-line-mode 1)
  ;; key binding
  (local-set-key (kbd "/") 'isearch-forward-regexp)
  (local-set-key (kbd "j") 'next-line)
  (local-set-key (kbd "k") 'previous-line))
(add-hook 'Buffer-menu-mode-hook 'my-buffer-menu-mode-hook)

;;================================================================
;; associate file with default mode 
(setq auto-mode-alist
	  (append '(
				(" \\.outline$"    . outline-mode)
				(" \\.c$"          . c-mode)
				(" \\.h$"          . c++-mode)
				(" \\.c++$"        . c++-mode)
				(" \\.h++$"        . c++-mode)
				(" \\.cc$"         . c++-mode)
				(" \\.hh$"         . c++-mode)
				(" \\.cpp$"        . c++-mode)
				(" \\.hpp$"        . c++-mode)
				(" \\.el$"         . emacs-lisp-mode)
				(" \\.lsp$"        . lisp-mode)
				(" \\.scm$"        . scheme-mode)
				(" \\.pl$"         . perl-mode)
				(" \\.py$"         . python-mode)
				)
			  auto-mode-alist))

;; ================================================================
;; terminal mode, get from multi-term written by Ahei(http://www.emacswiki.org/emacs/MultiTerm)
(defun multi-term-handle-close ()
  "Close current term buffer when `exit' from term buffer."
  (when (ignore-errors (get-buffer-process (current-buffer)))
    (set-process-sentinel (get-buffer-process (current-buffer))
                          (lambda (proc change)
                            (when (string-match "\\(finished\\|exited\\)" change)
                              (kill-buffer (process-buffer proc)))))))

(add-hook 'term-mode-hook 'multi-term-handle-close)

(defun my-term-mode-hook ()
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
							   (?` ?` _ "''")
							   (?\( _ ")")
							   (?\[  _ " ]")
							   ;;(?\< _ ">")
							   (?{ _ "}")
							   (?\" _ "\"")))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "'") 'skeleton-pair-insert-maybe)
  ;;(local-set-key (kbd "<")   'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "\"") 'skeleton-pair-insert-maybe)

  ;; keybindings
  ;; highlight-symbol
  (local-unset-key "\M-n")
  (local-unset-key "\M-p")
  (local-set-key "\M-n" 'highlight-symbol-next)
  (local-set-key "\M-p" 'highlight-symbol-prev)
  ;; char mode ande line mode
  (local-unset-key [(f8)])
  (local-set-key [(f8)]         'term-char-mode)
  (local-set-key [(control f8)] 'term-line-mode) ;does not work
  )

(add-hook 'term-mode-hook 'my-term-mode-hook)
;; ================================================================
;; w3m
(defun my-w3m-mode-hook()
  (hl-line-mode 1)
  ;; keybinding confict
  (local-unset-key "\M-n")
  (local-set-key "\M-n" 'highlight-symbol-next)

  ;; vi style key
  (local-set-key "/" 'isearch-forward-regexp)
  (local-set-key "?" 'isearch-backward-regexp) ;default: "?" is for (describe-mode)
  )

(add-hook 'w3m-mode-hook 'my-w3m-mode-hook)

;; ================================================================
;; view mode
(defun my-view-mode-hook()
  (define-key view-mode-map "/" 'isearch-forward-regexp)
  (define-key view-mode-map "?" 'isearch-forward-regexp)
  ;; line
  (define-key view-mode-map "j" 'next-line)
  (define-key view-mode-map "k" 'previous-line)
  (local-unset-key "0")
  (local-unset-key "9")
  (define-key view-mode-map "0" 'move-beginning-of-line)
  (define-key view-mode-map "9" 'move-end-of-line)
  ;; page
  (define-key view-mode-map " " 'scroll-up-command)
  ;; char
  (define-key view-mode-map "h" 'backward-char)
  (define-key view-mode-map "l" 'forward-char)
  ;; word
  (define-key view-mode-map "w" 'forward-word)
  (define-key view-mode-map "b" 'backward-word)
  ;; bind 'view-quit' to toggle:view-mode
  (define-key view-mode-map "q" 'view-mode)
  (define-key view-mode-map "i" 'view-mode)

  ;; cscope for c-mode
  (define-key view-mode-map "d"
    (lambda ()
      (interactive)
      (if (or(string= "c++-mode" major-mode)
             (string= "c-mode" major-mode))
          (cscope-find-global-definition-no-prompting))))
  ;; symbol
  (define-key view-mode-map "s"
    (lambda ()
      (interactive)
      (if (or(string= "c++-mode" major-mode)
             (string= "c-mode" major-mode))
          (cscope-find-this-symbol (thing-at-point 'symbol)))))
  ;; text string
  (define-key view-mode-map "t"
    (lambda ()
      (interactive)
      (if (or(string= "c++-mode" major-mode)
             (string= "c-mode" major-mode))
          (cscope-find-this-text-string (thing-at-point 'symbol)))))
  ;; calling function
  (define-key view-mode-map "c"
    (lambda ()
      (interactive)
      (if (or (string= "c++-mode" major-mode)
              string= "c-mode" major-mode)
          (cscope-find-functions-calling-this-function (thing-at-point 'symbol))
        (View-leave)                    ;default view mode binding
        )))
  ;; called function
  (define-key view-mode-map "C"
    (lambda ()
      (interactive)
      (if ((or(string= "c++-mode" major-mode)
              string= "c-mode" major-mode))
          (cscope-find-called-functions (thing-at-point 'symbol)))))

  (define-key view-mode-map "p" 'highlight-symbol-prev)
  (define-key view-mode-map "n" 'highlight-symbol-next)
  ;; to add for view-mode
  )

(add-hook 'view-mode-hook 'my-view-mode-hook)


;; ================================================================
(defun my-nxml-mode-hook()
  (setq indent-tabs-mode nil)
  )

(add-hook 'nxml-mode-hook 'my-nxml-mode-hook)

;; ================================================================
;; latex
(defun my-latex-mode-hook ()
  (auto-complete-mode 1)
  (local-set-key (kbd "<f5>")
                 (lambda()
                   (interactive)
                   (compile (concat "pdflatex " (buffer-name))))))
(add-hook 'latex-mode-hook 'my-latex-mode-hook)

;; ================================================================
;; man
(defun my-man-mode-hook ()
  (local-set-key "j" 'next-line)
  (local-set-key "k" 'previous-line)
  )
(add-hook 'Man-mode-hook 'my-man-mode-hook)

;; ================================================================
;; doc-view mode
(defun my-doc-view-mode-hook()
  (setq doc-view-continuous t)
  (local-set-key "j" 'next-line)
  (local-set-key "k" 'previous-line)
  (local-set-key "l" 'next-char)
  (local-set-key "h" 'previous-char)
  (local-set-key "=" 'doc-view-enlarge)
  (local-set-key "-" 'doc-view-shrink)
  (local-set-key "r" 'reload-file)

  ;; H - fit hight
  ;; P - fit page
  ;; W - fit width
  ;; < - begin of buffer
  ;; > - end of buffer
  )
(add-hook 'doc-view-mode-hook 'my-doc-view-mode-hook)

;; find file hook configure
(defun my-find-file-hook ()
  ;; automatically toggle view-mode for read only file
  (if buffer-read-only
      (progn
        (view-mode)
        (message "buffer read only"))))

(add-hook 'find-file-hook 'my-find-file-hook)
;; ================================================================
(defun my-compilation-mode-hook()
  ;; always stays at the end to scroll for output
  (end-of-buffer)
  (local-set-key (kbd "r")
                 (lambda()
                   (interactive)
                   (compile compile-command)))
  (local-set-key "n" 'next-error)
  (local-set-key "p" 'previous-error)
  (local-set-key "\C-\M-n" 'next-error)
  (local-set-key "\C-\M-p" 'previous-error)
  )
(add-hook 'compilation-mode-hook 'my-compilation-mode-hook)


;; ================================================================
(defun my-dired-mode-hook()
  (dired-omit-mode 1)
  (local-set-key [(f8)]
                 (lambda()
                   (interactive)
                   (dired-omit-mode 0)))
  (local-set-key [(control f8)]
                 (lambda()
                   (interactive)
                   (dired-omit-mode 1))))

(require 'dired-x)
(setq dired-omit-files "^\\...+$")
(add-hook 'dired-mode-hook 'my-dired-mode-hook)

;; ================================================================
;; end here.
;; 2012-04-20 10:30:39 li_kui
