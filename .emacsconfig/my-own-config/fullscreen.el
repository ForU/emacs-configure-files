;;================================================================
;; Emacs doesn't support this ever!!!
;;该函数用于全屏，状态值为2说明全屏后可以还原

(defun maximize-screen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
			 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
			 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))

(defun full-screen ()
  (interactive)
  
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
			 '(2 "_NET_WM_STATE_FULLSCREEN" 0))
  ;; ;; tool-bar-mode
  ;; (if tool-bar-mode
  ;;     (tool-bar-mode 0))
)

;;================================================================
;; is not good as above, when toggle-fullscreen, the mode line
;; does not expand to fullscreen.
(defun toggle-fullscreen ()
  "toggles whether the currently selected frame consumes the entire display or
   is decorated with a window border"
  (interactive)
  (let ((f (selected-frame)))
    (modify-frame-parameters
     f `((fullscreen . ,(if (eq nil (frame-parameter f 'fullscreen)) 'fullboth nil))))))

;;================================================================
;;code ends here.
