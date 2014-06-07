
(defun my-transparent ()
  "make the frame transparent."
  (interactive)
  ;; ;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
  (set-frame-parameter (selected-frame) 'alpha '(80 80))
  ;;(add-to-list 'default-frame-alist '(alpha 65 50))
  )

;;================================================================
(defun my-transparent-stop ()
  "make the frame transparent stop."
  (interactive)
  (set-frame-parameter (selected-frame) 'alpha '(100 100))
  )
