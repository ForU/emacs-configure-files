;; Change cursor color and type according to mode

(defvar my-set-cursor-color-color "")
(defvar my-set-cursor-color-buffer "")
(defun my-set-cursor-color-according-to-mode ()
  "change cursor color according to some minor modes."
  ;; CURSOR COLOR
  ;; set-cursor-color is somewhat costly, so we only call it when needed:
  (let ((color
	 (if buffer-read-only "yellow"
	   (if overwrite-mode "blue"
	     "red3"))))
    (unless (and
	     (string= color my-set-cursor-color-color)
	     (string= (buffer-name) my-set-cursor-color-buffer))
      (set-cursor-color (setq my-set-cursor-color-color color))
      (setq my-set-cursor-color-buffer (buffer-name))))
  ;; CURSOR TYPE
  (if (or buffer-read-only overwrite-mode)
      (setq cursor-type 'box)
;    (setq cursor-type 'bar)))
    (setq cursor-type 'box)))

(add-hook 'post-command-hook 'my-set-cursor-color-according-to-mode)
