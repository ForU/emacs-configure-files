;;http://www.cnblogs.com/coderzh/archive/2009/12/26/emacspythonide.html
;; (add-to-list 'load-path "~/.emacs.d/plugins/rope/")
;; (add-to-list 'load-path "~/.emacs.d/plugins/ropemode/")
;; (add-to-list 'load-path "~/.emacs.d/plugins/pymacs/")
;; (add-to-list 'load-path "~/.emacs.d/plugins/pycomplete/")

;; ;; pymacs
;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)

;; ;; ropemacs 
;; (pymacs-load "ropemacs")
;; (setq ropemacs-enable-autoimport t)

;; ;; pycomplete
;; (require 'pycomplete)
;; (setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
;; (autoload 'python-mode "python-mode" "Python editing mode." t)
;; (setq interpreter-mode-alist(cons '("python" . python-mode)
;;                            interpreter-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-python-common-hook()
  (add-hook 'python-mode-hook 
            (lambda ()
              (which-function-mode t)))

  ;; check 
  (defun check-command()
    (let ((file (file-name-nondirectory buffer-file-name)))
      (if (equal (file-name-extension buffer-file-name) "py")
		  (progn
			(format "%s %s"
					(or (getenv "PYTHON_CHECKER") "pychecker")
					buffer-file-name 
					)))))
  (defun do-check()
    (interactive)
    (python-check (check-command)))
  
  ;; compile, to generate *.pyc file
  (defun compile-command()
    (let ((file (file-name-nondirectory buffer-file-name)))
      (if (equal (file-name-extension buffer-file-name) "py")
		  (progn
			(format "%s %s"
					(or (getenv "PYTHON_COMPILER") "python")
					buffer-file-name 
					)))))

  (defun do-compile()
    (interactive)
    (setq compilation-finish-functions
		  (lambda (buf str)
			(if (string-match "exited abnormally" str)
				;;there were errors
				(message "compilation errors, C-M-n to goto next error.")
			  ;;no errors, make the compilation window go away in 5.0 seconds
			  ;;(run-at-time 5.0 nil 'delete-windows-on buf)
			  (message "No warning(s)!")
			  
			  (if (gnus-buffer-exists-p "*python-term*")
				  (progn
					(switch-to-buffer-other-window "*python-term*"))
				;; (term-send-up))
				
				;; else create buffer "*python-term*
				(switch-to-buffer-other-window "*compilation*")
				(split-window-vertically nil)
				(ansi-term "/bin/bash" "python-term")
				))))
    (compile (compile-command)))

  ;; execute current buffer
  (defun do-execute-buffer()
    (py-execute-buffer))

  (local-set-key [(shift f5)] (lambda ()
								(interactive)(do-check)))
  (local-set-key [(control f5)] (lambda ()
								  (interactive)(do-compile)))
  (local-set-key [(f5)] (lambda ()
						  (interactive)(do-execute-buffer)))
  
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; pdb configure
  ;; pdb setup, note the python version
  (setq pdb-path '/usr/bin/pdb
		gud-pdb-command-name (symbol-name pdb-path))
  (defadvice pdb (before gud-query-cmdline activate)
    "Provide a better default command line when called interactively."
    (interactive
     (list (gud-query-cmdline pdb-path
							  (file-name-nondirectory buffer-file-name)))))
  
  (local-set-key [(f5)] (lambda()(interactive)(jump-to-terminal "python-terminal")))
  (local-set-key [(f6)] 'pdb)
  (local-set-key [(f7)] 'py-pep8-run)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; keybinding
  (local-set-key "\M-l" 'dabbrev-expand)
  (local-set-key "\C-\M-n" 'next-error)
  (local-set-key "\C-\M-p" 'previous-error)
  ;; tab, space
  (setq py-indent-tabs-mode 0)
  (setq-default tab-width 4)
  )

;; add my hook to the python-mode-hook
(add-hook 'python-mode-hook 'my-python-common-hook)

;; ends here
