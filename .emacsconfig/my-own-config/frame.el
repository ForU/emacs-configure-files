;;================================================================
(defun my-arrange-frame (w h x y)
  "Set the width, height, and x/y position of the current frame"
  (let ((frame (selected-frame)))
    ;; ;; better comment the following line, so windows appearance
    ;; ;; will not change.
    ;; (delete-other-windows)
    (set-frame-position frame x y)
    (set-frame-size frame w h)))

(defun my-default-frame()
  "default frame size!"
  (interactive)
  (my-arrange-frame 80 20 80 250))

(defun my-large-frame()
  "large frame size!"
  (interactive)
  (my-arrange-frame 175 60 15 15))

;;================================================================
;; code ends here
;; Modified on < Mon Dec 21 17:14:13 2009 >

