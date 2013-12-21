					;show ascii table
					;Fri Jul 24 2009  3:24:48 AM
(defun ascii-table ()
  "Print the ascii table. Based on a defun by Alex Schroeder <asc@bsiag.com>"
  (interactive)
  (pop-to-buffer "*ASCII*")
  (erase-buffer)
  (insert (format "ASCII characters up to number %d.\n" 254))
  (let ((i 0) (sep "======================="))
    (while (< i 254)
      (setq i (+ i 1))
      (insert (format "%4d:%c\t" i i))
      (if (or (eq i 47)
      	      (eq i 122)
	      (eq i 126)
	      )
      	  (insert (format "\n%s%s%s\n" sep sep sep))))
    (beginning-of-buffer)))


;; Add Line numbers when printing (GREAT when printing out code)
(setq ps-line-number t)


;;######################http://planet.emacsen.org/################
;output the number of words in the buffer:
(defun wc nil
  "Count words in buffer"
  (interactive)
  (shell-command-on-region (point-min) (point-max) "wc -w"))
;; ================================================================
;; end here.
;; Sat Apr 14 12:09:49 2012


;;================================================================
;;code ends here.
