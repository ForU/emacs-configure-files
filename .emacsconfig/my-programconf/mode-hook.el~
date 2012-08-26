;; ================================================================
;; (add-hook 'text-mode-hook 'flyspell-mode)
;; (add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'diary-hook 'appt-make-list)

;; ================================================================
;; shell script mode
(defun my-sh-mode-hook ()
  (interactive)
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
;; python
(defun my-python-mode-hook()
  (interactive)
  (local-set-key (kbd "<f5>")
				 (lambda ()
				   (interactive)
				   (local-set-key [(f5)] (jump-to-terminal "python-term")))))
(add-hook 'python-mode-hook 'my-python-mode-hook)

;; ================================================================
;; perl script mode
(defun my-perl-mode-hook()
  (interactive)
  ;; do something here
  (local-set-key (kbd "<f5>")
				 (lambda ()
				   (interactive)
				   (local-set-key [(f5)] (jump-to-terminal "perl-term")))))

(add-hook 'perl-mode-hook 'my-perl-mode-hook)

;; ================================================================
;; emacs lisp mode or lisp interaction mode
(defun my-elisp-mode-hook ()
  (interactive)
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
  (interactive)
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

  ;; no text-mode-style indent
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))))
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
  (interactive)
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


(defun my-term-mode-keys()
  "rebinding some key for term mode"
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
(add-hook 'term-mode-hook 'my-term-mode-keys)
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
  (define-key view-mode-map " " 'forward-page)
  ;; char
  (define-key view-mode-map "l" 'forward-char)
  (local-unset-key "h")
  (define-key view-mode-map "h" 'backward-char)
  ;; word
  (define-key view-mode-map "w" 'forward-word)
  (define-key view-mode-map "b" 'backward-word)
  )

(add-hook 'view-mode-hook 'my-view-mode-hook)


;; ================================================================
(defun my-nxml-mode-hook()
  (setq indent-tabs-mode nil)
  )

(add-hook 'nxml-mode-hook 'my-nxml-mode-hook)

;; ================================================================
;; end here.
;; 2012-04-20 10:30:39 li_kui
