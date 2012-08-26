(defun my-word-number-of-file ( )
  "count the number of the file ;and print  a message in the minibuffer with the result."
  (interactive)
  (save-excursion
  (let ((count  0))
       (goto-char (point-min))
       (while (< (point) (point-max))
	 (forward-word 1)
	 (setq count (1+ count)))
(message "file contains [ %d ] words." count))))
;NOTICE:    this is only for < Xwindow emacs >.
