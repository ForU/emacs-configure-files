;;================================================================
(defun my-whole-line-number ( )
  "count the number of lines in the buffer ,and print the number in the minibuffer."
  (interactive)
  (save-excursion
    (let ((line-count 0))
      (goto-char (point-min))
      (while (< (point) (point-max))
					;(next-line 1)
        (forward-line 1)
	(setq line-count (1+ line-count)))
      (message "file contains [ %d ] lines." line-count))))
