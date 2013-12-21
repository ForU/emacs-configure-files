;; ================================================================
(global-auto-complete-mode t)           ;enable global-mode
;(setq-default global-auto-complete-mode t)
(setq ac-dwim t)

;;================================================================
;; whether to ac-auto-start or not is defined here.
;; type 2  characters and begin to autoload, if this is on,
;; then the ac-start is off.

(defun my-acs-on ()
  "ac-auto-start on"
  (interactive)
  (setq ac-auto-start 1))

(defun my-acs-off ( )
  "ac-auto-start off"
  (interactive)
  (setq ac-auto-start nil)
  (global-set-key "\C-l" 'ac-start))

(global-set-key "\C-l" 'ac-start)
;; initially
(my-acs-on)


;; ================================================================
;; keybinding
;; ================================================================
;;(define-key ac-complete-mode-map "\r" 'nil)
;;(define-key ac-complete-mode-map " " 'ac-expand)

(define-key ac-complete-mode-map "l" 'ac-stop)
;; (define-key ac-complete-mode-map " " 'ac-expand)
;; (define-key ac-complete-mode-map "\t" 'ac-expand)
(define-key ac-complete-mode-map " " 'ac-complete)
;; notice:   This can move much quicker only when ac-auto-start is
;;           nil. Otherwise this could be a barrier.

;; ;; default:
;; (define-key ac-complete-mode-map "\c-n" 'ac-next)
;; (define-key ac-complete-mode-map "\c-p" 'ac-previous)
;; vi style:
(define-key ac-complete-mode-map "k" 'ac-previous)
(define-key ac-complete-mode-map "j" 'ac-next)

;; ;; emacs style:
;; (define-key ac-complete-mode-map "p" 'ac-previous)
;; (define-key ac-complete-mode-map "n" 'ac-next)


;;================================================================
;; color configure
;;================================================================
(set-face-background 'ac-candidate-face "lightgray")
(set-face-foreground 'ac-candidate-face "black")
;;(set-face-underline  'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "magenta")
(set-face-foreground 'ac-selection-face "white")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;auto-complete设置
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
;; (ac-config-default)

;; ;; (require 'auto-complete-yasnippet)
;; ;; (require 'auto-complete-etags)
;; ;; (require 'auto-complete-extension)
;; ;; (require 'auto-complete-octave)
;; ;; (require 'auto-complete+)

;; (global-auto-complete-mode t)
;; (setq-default ac-sources '(ac-source-words-in-same-mode-buffers))
;; (add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))
;; (add-hook 'auto-complete-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-filename)))

;;================================================================
;; from the EmacsWiki
;; http://www.emacswiki.org/emacs/AutoComplete#toc3

;; (when (require 'auto-complete nil t)

;;   ;;================================================================
;;   ;; from EmacsWiki
;;   (set-default 'ac-sources '(ac-source-abbrev ac-source-words-in-buffer ))

;;   (setq ac-modes
;; 	(append ac-modes
;; 		'(eshell-mode
;; 		  shell-mode
;; 		  org-mode)))

;;   (add-hook 'emacs-lisp-mode-hook
;; 	    (lambda()
;; 	      (setq ac-sources '(ac-source-yasnippet ac-source-abbrev ac-source-words-in-buffer ac-source-symbols))))

;;   (add-hook 'eshell-mode-hook
;; 	    (lambda()
;; 	      (setq ac-sources '(ac-source-yasnippet ac-source-abbrev ac-source-words-in-buffer ac-source-files-in-current-dir))))

;;   (add-hook 'c-mode-hook
;; 	    (lambda()
;; 	      (setq ac-sources '(ac-source-yasnippet ac-source-abbrev ac-source-words-in-buffer ac-source-c++-keywords))))
;; )

;; ;;================================================================
;; (add-to-list 'load-path "~lk/.emacsconfig/cedet/semantic")
;; (require 'semantic-ia)

;; (add-hook 'c-mode-common-hook
;; 	  '(lambda()
;; 	     ;; ac-omni-completion-sources is made buffer local so
;; 	     ;; you need to add it to a mode hook to activate on 
;; 	     ;; whatever buffer you want to use it with.  This
;; 	     ;; example uses C mode (as you probably surmised).

;; 	     ;; auto-complete.el expects ac-omni-completion-sources to be
;; 	     ;; a list of cons cells where each cell's car is a regex
;; 	     ;; that describes the syntactical bits you want AutoComplete
;; 	     ;; to be aware of. The cdr of each cell is the source that will
;; 	     ;; supply the completion data.  The following tells autocomplete
;; 	     ;; to begin completion when you type in a . or a ->

;; 	     (add-to-list 'ac-omni-completion-sources
;; 			  (cons "\\." '(ac-source-semantic)))
;; 	     (add-to-list 'ac-omni-completion-sources
;; 			  (cons "->" '(ac-source-semantic)))

;; 	     ;; ac-sources was also made buffer local in new versions of
;; 	     ;; autocomplete.  In my case, I want AutoComplete to use 
;; 	     ;; semantic and yasnippet (order matters, if reversed snippets
;; 	     ;; will appear before semantic tag completions).

;; 	     ;; (setq ac-sources '(ac-source-semantic ac-source-yasnippet))

;; 	     ))

;; ================================================================
;; python
(defvar ac-source-python '((candidates .
		(lambda ()
		  (mapcar '(lambda (completion)
					 (first (last (split-string completion "\\." t))))
				  (python-symbol-completions (python-partial-symbol)))))))
(add-hook 'python-mode-hook
		   (lambda() (setq ac-sources '(ac-source-python))))
;;================================================================
;; configure ends here.

