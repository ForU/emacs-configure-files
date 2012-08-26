;; ================================================================
;; useful when your file changes after "svn update" or other program
;; change the file's disk content
(defun reload-file()
  (interactive)
  (let ((file (file-name-nondirectory buffer-file-name)))
    (find-file file)))
(global-set-key (kbd "<f7>") 'reload-file)

;; TODO: diff-file

;; used for any buffer (including *term* buffer if exists, or
;; a *term* buffer is created with fundamental mode on )
(defun buffer-exists (buf-name) (get-buffer buf-name))
(defun jump-to-buffer(buf-name)
  "go to buffer if it exists, otherwise generate a new buffer"
  (interactive)
  (if (buffer-exists buf-name)
      (pop-to-buffer buf-name)
    (pop-to-buffer (generate-new-buffer buf-name))))

;; ================================================================

;; ================================================================
;; ;; works version, but functions limited
;; (defun write-buffer-substring-to-file(file-name buf-name start end &optional header-type)
;;   "write @param:buffer(named buf-name)'s substring marked by @start by
;;  @end to file named @param:file-name, and if buf-name is not yet exists,
;; then just create a new @buf-name buffer and return"
;;   ;; TODO:  1. argv check [1] file named file-name exists,
;;   ;;                      [2] start > end
;;   ;; 		2. start end to be &optional
;;   (let((file-buf-name (file-name-nondirectory file-name)))
;; 	(if (buffer-exists buf-name)
;; 		(if (buffer-exists file-buf-name)
;; 			(progn
;; 			  (set-buffer file-buf-name)
;; 			  (goto-char (point-max))	;append
;; 			  (newline)
;; 			  (if (string= header-type "1")			;1-level header
;; 				  (insert note-header))
;; 			  (if (string= header-type "2")			;2-level header
;; 				  (insert note-sub-header))
;; 			  (if (string= header-type "3")			;3-level header
;; 				  (insert note-sub-header))
;; 			  (insert-buffer-substring-no-properties buf-name start end)
;; 			  (save-buffer (buffer-name)))
;; 		  ;; else, file buf not exists
;; 		  (find-file file-name)
;; 		  (write-buffer-substring-to-file file-name buf-name start end))
;; 	  ;; else, buf:[buf-name] not exists
;; 	  (jump-to-buffer buf-name))))
;; 
;; (global-set-key [(control shift f11)]
;; 				(lambda()
;; 				  (interactive)
;; 				  (write-region-to-file "~/__note__.outline" (buffer-name) "3")))
;; ;; note with header 3
;; (global-set-key [(f11)]
;; 				(lambda()
;; 				  "write region to file"
;; 				  (interactive)
;; 				  (write-region-to-file "~/__note__.outline" (buffer-name) "0")))
;; ;; note with header 2
;; (global-set-key [(control f11)]
;; 				(lambda()
;; 				  "write whole buffer to file"
;; 				  (interactive)
;; 				  (write-region-to-file "~/__note__.outline" (buffer-name) "1")))
;; ;; note with header 1
;; (global-set-key [(shift f11)]
;; 				(lambda()
;; 				  (interactive)
;; 				  (write-region-to-file "~/__note__.outline" (buffer-name) "2")))
;; (global-set-key [(control shift f11)]
;; 				(lambda()
;; 				  (interactive)
;; 				  (write-region-to-file "~/__note__.outline" (buffer-name) "3")))
;; ================================================================

;; ================================================================
(require 'term)
(defun jump-to-terminal (term-buf-name)
  "If the current buffer is:
     1) a running ansi-term named @param: term-buf-complete-name, message
     2) a stopped ansi-term, kill it and create a new one.
     3) a non ansi-term, go to an already running ansi-term
        or start a new one while killing a defunt one"
  (interactive)
  (setq term-buf-complete-name (concat "*" term-buf-name "*"))
  (let ((is-term-buffer (string= "term-mode" major-mode))
        (is-running (term-check-proc (buffer-name)))
        (term-cmd "/bin/bash")
        (term-exists (get-buffer term-buf-complete-name)))
    (if is-term-buffer
        (if is-running
            (if (string= term-buf-complete-name (buffer-name))
				(progn
				  (message "already in %s, use previous command" (buffer-name))
				  (term-send-up))		;; TODO: check whether at prompt
              (if term-exists
				  (progn
					(pop-to-buffer term-buf-complete-name)
					(term-send-up))
                (ansi-term term-cmd term-buf-name)))
		  ;; else, no process
          (kill-buffer (buffer-name))
          (ansi-term term-cmd term-buf-name))
      ;; else, in other buffer
      (if term-exists
          (if (term-check-proc term-buf-complete-name)
			  (progn
				(pop-to-buffer term-buf-complete-name)
				(term-send-up))
            (kill-buffer term-buf-complete-name)
            (ansi-term term-cmd term-buf-name))
        (ansi-term term-cmd term-buf-name)))))


(global-set-key (kbd "<f12>")
				(lambda() (interactive)
				  (jump-to-terminal "c-term")))
(global-set-key [(control f12)]
				(lambda() (interactive)
				  (jump-to-terminal "TS232")))
(global-set-key [(shift f12)]
				(lambda() (interactive)
				  (jump-to-terminal "246")))
(global-set-key [(control shift f12)]
				(lambda() (interactive)
				  (jump-to-terminal "mysql@246")))

;; ================================================================
;; cua-mode, since cua-mode has no hook, then we define a keybinding here
;;
;; http://stackoverflow.com/questions/7625824/vim-visual-selection-delete-insert-in-emacs
;;
;; The first line is necessary to prevent cua-mode from replacing a bunch of standard keyboard
;; shortcuts with Windows-style things (C-c for copy, C-x for cut etc).
;;
;; Once you're in cua-mode, C-enter will turn on visual rectangles, which you can then expand with
;; the movement keys (arrows, C-n, C-f etc) to cover the text you want to manipulate. While this is
;; going on, hitting enter moves the cursor around the edges of the rectangle, and anything you
;; type is inserted outside the rectangle on the same side as the cursor. The insertion matches
;; the size of the rectangle, so if you want to add the same text to the beginning (or middle or
;; end) of a bunch of lines at once, this is the fastest way to do it.
;;
;; If you disabled the cua keybindings, then C-w will kill the contents of the rectangle. 

(defun my-cua-mode-trigger()
  (interactive)
  (setq cua-enable-cua-keys nil)
  (cua-mode))

(provide 'lib)
;; ================================================================
;; end here.
;; 2012-05-16 xiangshou24@gmail.com
