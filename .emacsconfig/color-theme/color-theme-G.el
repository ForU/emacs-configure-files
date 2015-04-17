(require 'color-theme)

(defun term-color-for-G()
  (setq term-default-bg-color "#C6CCD0")
  (setq term-default-fg-color "black")
  )

(defun color-theme-G ()
  ""
  (interactive)
  (color-theme-install
   '(color-theme-G
     ((foreground-color . "black")
      (background-color . "#C6CCD0")
      (background-mode . dark)
      (cursor-color . "#73d216") ; medium chameleon
      (mouse-color . "#73d216"))

     ;;; Standard font lock faces
     (default ((t (nil))))
     (font-lock-comment-face ((t (:foreground "PaleGreen4" :bold t))))
     (font-lock-comment-delimiter-face ((t (:foreground "PaleGreen4" :bold t))))
     (font-lock-doc-face ((t (:foreground "#77507b"))))
     (font-lock-doc-string-face ((t (:foreground "#77507b"))))
     (font-lock-string-face ((t (:foreground "#77507b"))))
     (font-lock-keyword-face ((t (:foreground "#9726E0" :bold t))))
     (font-lock-builtin-face ((t (:foreground "#484085" :bold t))))
     (font-lock-function-name-face ((t (:foreground "#0709EE" :bold t))))
     (font-lock-variable-name-face ((t (:foreground "#975331" ))))
     (font-lock-preprocessor-face ((t (:foreground "#888a85"))))
     (font-lock-constant-face ((t (:foreground "#4e9a06" :italic t))))
     (font-lock-type-face ((t (:foreground "#268627"))))
     (font-lock-warning-face ((t (:bold t :foreground "#cc0000"))))

     ;; Search
     (isearch ((t (:foreground "#080808" :background "#edd400"))))
     (isearch-lazy-highlight-face ((t (:foreground "#080808" :background "#2e3436"))))

     ;; Emacs Interface
     (fringe ((t (:background "white"))))
     ;; (border ((t (:background "#0f0f0f"))))
     (mode-line ((t (:background "gray70" :foreground "black" :box (:line-width 1 :color "gray75" :style released-button)))))
	 (mode-line-buffer-id ((t (:foreground "blue3" :bold t))))
     (mode-line-inactive ((t (:background "gray90" :foreground "gray20" :weight light :box (:line-width 1 :color "gray70")))))
     (minibuffer-prompt ((t (:foreground "#2674f2"))))
     (region ((t (:background "gray70"))))

     ;; Parenthesis matching
     (show-paren-match-face ((t (:foreground "#2e3436" :background "#73d216"))))
     (show-paren-mismatch-face ((t (:foreground "#2e3436" :background "#ef2929"))))

     ;; Line highlighting
     (hl-line ((t (:background "#C6CCD0" :underline t))))

     ;; Calendar
     (holiday-face ((t (:foreground "#cc0000")))) ; dark scarlet red

     ;; Info
     (info-xref ((t (:foreground "#729fcf")))) ; light sky blue
     (info-xref-visited ((t (:foreground "#ad7fa8")))) ; light plum

     ;;; AUCTeX
     (font-latex-sectioning-5-face ((t (:foreground "#c4a000" :bold t)))) ; dark butter
     (font-latex-bold-face ((t (:foreground "#4e9a06" :bold t)))) ; dark chameleon
     (font-latex-italic-face ((t (:foreground "#4e9a06" :italic t)))) ; dark chameleon
     (font-latex-math-face ((t (:foreground "#855c1b")))) ; med-dark chocolate
     (font-latex-string-face ((t (:foreground "#77507b")))) ; plum
     (font-latex-warning-face ((t (:foreground "#cc0000")))) ; dark scarlet red
     (font-latex-slide-title-face ((t (:foreground "#c4a000")))) ; dark butter

     ;;; post-mode
     (post-emoticon-face ((t (:background "#edd400" :foreground "#000000")))) ; medium butter
     (post-header-value-face ((t (:foreground "#4e9a06")))) ; dark chameleon
     (post-header-keyword-face ((t (:foreground "#4e9a06" :bold t)))) ; dark chameleon
     (post-signature-text-face ((t (:foreground "#cc0000")))) ; dark scarlet red
     (post-quoted-text-face ((t (:foreground "#855c1b" :slant normal)))) ; med-dark chocolate
     (post-double-quoted-text-face ((t (:foreground "#77507b" :slant normal)))) ; plum
     (post-multiply-quoted-text-face ((t (:foreground "#61635e" :slant normal)))) ; dark aluminum
     (post-email-address-text-face ((t (:foreground "#729fcf" :bold t)))) ; light sky blue
     (post-url-face ((t (:foreground "#729fcf" :bold t)))) ; light sky blue
     (semantic-highlight-edits-face ((t (:background "#C6CCD0"))))
     ;; same as comment
     (linum ((t: (:foreground "gray30"))))
     (moccur-face ((t (:background "gray70"))))
     (trailing-whitespace ((t (:background "black"))))
     (ecb-default-highlight-face ((t (:background "#B0C4DE" :foreground "#0709EE"))))
     (ecb-default-general-face ((t (:background "#C6CCD0" :foreground "gray10" :slant normal :italic nil))))
     ;;
     (outline-1 ((t (:foreground "black"))))
     (outline-2 ((t (:foreground "#F92672"))))
     (outline-3 ((t (:foreground "#A6E22E"))))
     (outline-4 ((t (:foreground "#AE81FF"))))
     (outline-5 ((t (:foreground "#E6DB74"))))
     (outline-6 ((t (:foreground "#66D9EF"))))
     (outline-7 ((t (:foreground "#F92672"))))
     (outline-8 ((t (:foreground "#A6E22E"))))

     ))
  (term-color-for-G)
  )

(provide 'color-theme-G)
