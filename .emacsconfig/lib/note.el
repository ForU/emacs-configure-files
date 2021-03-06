										;(require 'lib)
;; TODO:
;; 1. interactive set note file name
;; 2. multi-note-format support eg:org, outline mode
;; 3. code-region support, like (setq org-src-fontify-natively t)

(defvar note-org-header "* " "the 1-level header of org mode")
(defvar note-org-sub-header-2 "** " "the 2-level header of org mode")
(defvar note-org-sub-header-3 "*** " "the 3-level header of org mode")

(defvar note-outline-header "* " "the 1-level header of outline mode")
(defvar note-outline-sub-header-2 "** "  "the 2-level header of outline mode")
(defvar note-outline-sub-header-3 "*** " "the 3-level header of outline mode")

;; default
(defcustom default-note-file "~/Documents/emacs/note.org"
  "the default note file"
  :type 'string
  :group 'initialize)

(defcustom default-header-type "0"
  "no header specified"
  :type 'string
  :group 'initialize)

(defvar note-file "~/note" "the default note file")
(defvar note-file-buffer-name "note" "the default note file buffer")

(defun do-note (new-note-file)
  "do some note and put notes into @note-file"
  (interactive (list (read-from-minibuffer "Please give a note file: "
										   "~/note")))
  ;; pick the name of new note file
  (setq note-file
		(if new-note-file
			new-note-file
		  default-note-file))
  ;; pick the buffer name for coresponding file
  (setq note-file-buffer-name (file-name-nondirectory note-file))
  (message "in do-note, note file name: %s, note file buffer name: %s" note-file note-file-buffer-name))

;; test version
;; TODO:  1. argv check [1] file named file-name exists,
;;                      [2] start > end
(defun write-buffer-substring-to-file(start end &optional header-type)
  "write a buffer's' substring marked by @start and
 @end to file named @param:note-file"
  (message "in write-buffer-substring-to-file, note file name: %s, note file buffer name: %s" note-file note-file-buffer-name)
  (save-restriction					;make region highlight off after copy done
    (setq old-buffer (current-buffer))
    (if (buffer-exists note-file-buffer-name)
		(progn
		  (set-buffer note-file-buffer-name)
		  (goto-char (point-max))	;append
		  (newline)
		  (message "default header type: %s" default-header-type)
		  (if (> (length header-type) 0)
			  (cond
			   ((string= header-type "0") ()) ;do nothing
			   ((string= header-type "1") (insert note-outline-header))
			   ((string= header-type "2") (insert note-outline-sub-header-2))
			   ((string= header-type "3") (insert note-outline-sub-header-3))
			   (t (write-buffer-substring-to-file start end default-header-type))))
		  (insert-buffer-substring-no-properties old-buffer start end)
		  (save-buffer (buffer-name))
		  (set-buffer old-buffer)
		  )
      ;; else, note file buffer not exists
      (find-file note-file)
      (message "type: %s" header-type)
      (write-buffer-substring-to-file start end header-type))
    ))

(defun write-region-to-file(&optional header-type)
  (interactive)
  (if mark-active
      (write-buffer-substring-to-file (region-beginning) (region-end) header-type)
    (message "no region selected, do nothing !")))

;; ================================================================

(global-set-key [(f11)] 'write-region-to-file)

(global-set-key [(control f11)]
				(lambda()
				  "write whole buffer to file"
				  (interactive)
				  (write-region-to-file "1")))
(global-set-key [(shift f11)]
				(lambda()
				  (interactive)
				  (write-region-to-file "2")))

;; note with header 3
(global-set-key [(control shift f11)]
				(lambda()
				  (interactive)
				  (write-region-to-file "3")))
