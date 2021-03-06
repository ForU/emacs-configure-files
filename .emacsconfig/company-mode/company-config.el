;; ============================================================
;; set as auto-complete-mode
;; must needed:
(add-to-list 'load-path "~/.emacs.d/plugins/company-mode")
(require 'company)

;; also can put configure here.
;; this take a lot cpu and memory, be careful to use it.
;; the last argv is nil-> off, t->on
(autoload 'company-mode "company" nil t)
;(company-mode t)

;; alternatively ;; default is 0.7 secs
;(setq company-idle-delay t)	
(setq company-auto-begin 2)

(dolist (hook (list
               'emacs-lisp-mode-hook
               'lisp-mode-hook
               'lisp-interaction-mode-hook
               'scheme-mode-hook
               'c-mode-common-hook
               'python-mode-hook
               'haskell-mode-hook
               'asm-mode-hook
	       'org-mode-hook
	     ;  'text-mode-hook
               'emms-tag-editor-mode-hook
               'sh-mode-hook))
  (add-hook hook 'company-mode))

;; some keybinding:

(defun my-company-on ()
  "ac-auto-start on"
  (interactive)
  (setq company-auto-begin 1))

(defun my-company-off ( )
  "ac-auto-start off"
  (interactive)
  (setq company-auto-begin nil)
  (global-set-key "\M-l" 'company-complete-common))

(global-set-key "\M-l" 'company-complete-common)

;; default keybinding is in company.el
(define-key company-active-map "\e\e\e" 'company-abort)
(define-key company-active-map (kbd "l") 'company-abort)
(define-key company-active-map (kbd "j") 'company-select-next)
(define-key company-active-map (kbd "k") 'company-select-previous)
;;(define-key company-active-map (kbd "<down>") 'company-select-next)
;;(define-key company-active-map (kbd "<up>") 'company-select-previous)
;;(define-key company-active-map [down-mouse-1] 'ignore)
;;(define-key company-active-map [down-mouse-3] 'ignore)

(define-key company-active-map [mouse-1] 'company-complete-mouse)
(define-key company-active-map [mouse-3] 'company-select-mouse)
(define-key company-active-map [up-mouse-1] 'ignore)
(define-key company-active-map [up-mouse-3] 'ignore)

(define-key company-active-map "" 'company-complete-selection)
(define-key company-active-map "" 'company-complete)
(define-key company-active-map "\t" 'company-complete)

(define-key company-active-map (kbd "<home>") 'company-show-doc-buffer)
;(define-key company-active-map "\C-w" 'company-show-location)
(define-key company-active-map "\C-s" 'company-search-candidates)
(define-key company-active-map "\C-\M-s" 'company-filter-candidates)

;; ================================================================
;; ;; NOTICE:   for c/c++ coding.
;; ;; Sun Nov 15 2009  1:09:34 PM
;; ;; http://liyanrui.is-programmer.com/2009/8/29/emacs-company-with-semantic.10937.html
;; (add-hook 'c-mode-hook 
;; 	  (lambda ()
;; 	    (setq semanticdb-default-save-directory "~/.emacs.d/semanticdb")	
;; 	    (semantic-load-enable-code-helpers)
;; 	    (setq company-idle-delay t)
;; 	    (company-mode)))

;; ============================================================
;;Usage
;;Enable company-mode with M-x company-mode.  Completion will start
;; automatically after you type a few letters.  Use M-n, M-p, <tab> and <space>
;; to complete.  Search through the completions with C-s, C-r and C-o.
;;NOTICE: M-n keybinding.
