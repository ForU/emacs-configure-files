(defun term-color-for-twilight()
  (setq term-default-bg-color "#141414")
  ;;(setq term-default-fg-color "#F8F8F8")
  (setq term-default-fg-color "gray90")
  )

(eval-when-compile
  (require 'color-theme))


(defun color-theme-twilight ()
  "TextMate Twilight theme for GNU Emacs."
  (interactive)
  (color-theme-install
   '(color-theme-twilight
	 ((background-color . "#141414")
	  (background-mode . dark)
	  (border-color . "black")
	  (cursor-color . "#DDDD00")
	  ;;(foreground-color . "#F8F8F8")
      (foreground-color . "gray90")
	  (mouse-color . "sienna1"))
	 (default ((t (:background "#141414" :foreground "#CACACA"))))
	 (blue ((t (:foreground "blue"))))
	 (border-glyph ((t (nil))))
	 (buffers-tab ((t (:background "#141414" :foreground "#CACACA"))))
	 (font-lock-builtin-face ((t (:foreground "#CACACA"))))
     (font-lock-comment-delimiter-face ((t (:foreground "#5F5A60" :italic t :bold t))))
	 (font-lock-comment-face ((t (:foreground "#5F5A60" :bold t))))
	 (font-lock-constant-face ((t (:foreground "#CF6A4C"))))
	 (font-lock-doc-string-face ((t (:foreground "DarkOrange"))))
	 (font-lock-function-name-face ((t (:foreground "#9B703F"))))
	 (font-lock-keyword-face ((t (:foreground "#CDA869"))))
	 (font-lock-preprocessor-face ((t (:foreground "Aquamarine"))))
	 (font-lock-reference-face ((t (:foreground "SlateBlue"))))


    ;; Enhanced-Ruby-Mode
	 (ruby-string-delimiter-face  ((t (:foreground "#5A6340"))))
	 (ruby-regexp-delimiter-face ((t (:foreground "orange"))))
	 (ruby-heredoc-delimiter-face ((t (:foreground "#9B859D"))))
	 (ruby-op-face ((t (:foreground "#CDA869"))))

	 (font-lock-regexp-grouping-backslash ((t (:foreground "#E9C062"))))
	 (font-lock-regexp-grouping-construct ((t (:foreground "red"))))

	 (minibuffer-prompt ((t (:foreground "#5F5A60"))))
	 (ido-subdir ((t (:foreground "#CF6A4C"))))
	 (ido-first-match ((t (:foreground "#8F9D6A"))))
	 (ido-only-match ((t (:foreground "#8F9D6A"))))
	 (mumamo-background-chunk-submode ((t (:background "#222222"))))

	 (linum ((t (:background "#141314" :foreground "gray50"))))
	 (hl-line ((t ( :underline t))))
	 (region ((t (:background "#373446"))))
	 (yas/field-highlight-face ((t (:background "#27292A"))))
     (fringe ((t (:background "gray30"))))
     (mode-line-buffer-id ((t (:foreground "blue3" :bold t))))
	 (mode-line ((t (:background "grey80" :foreground "gray20" :box (:line-width -1 :color "grey50") :height 1.0))))
	 (mode-line-inactive ((t (:background "grey20" :foreground "gray70" :weight light :box (:line-width -1 :color "gray15") :height 1.0))))

	 (magit-item-highlight ((t (:background "#191930"))))
	 (magit-diff-add ((((class color) (background dark)) (:foreground "green"))))
	 (org-hide ((((background dark)) (:foreground "#141414"))))
	 (outline-4 ((t (:foreground "#8F8A80"))))

	 (diff-removed ((((class color) (background dark)) (:foreground "orange"))))
	 (diff-added ((((class color) (background dark)) (:foreground "green"))))

	 (font-lock-string-face ((t (:foreground "#8F9D6A"))))
	 (font-lock-type-face ((t (:foreground "#9B703F"))))
	 (font-lock-variable-name-face ((t (:foreground "#7587A6"))))
	 (font-lock-warning-face ((t (:background "#EE799F" :foreground "red"))))
	 (gui-element ((t (:background "#D4D0C8" :foreground "black"))))
	 (region ((t (:background "#27292A"))))
	 (highlight ((t (:background "#111111"))))
	 (highline-face ((t (:background "SeaGreen"))))
	 (left-margin ((t (nil))))
	 (text-cursor ((t (:background "yellow" :foreground "black"))))
	 (toolbar ((t (nil))))
	 (underline ((nil (:underline nil))))
     ;; woman
     (woman-bold ((t (:foreground "yellow2"))))
     (woman-italic ((t (:foreground "red2"))))
     ;; tabbar
     (tabbar-default ((t (:foreground "gray20" :box (:line-width 1 :color "gray20" :style nil)))))
     (tabbar-unselected ((t (:foreground "gray30" :background "white" :box (:line-width 1 :color "gray30" :style nil)))))
     (tabbar-selected ((t (:foreground "blue3" :background "gray75" :bold t :box (:line-width 1 :color "gray70" :style nil)))))
     (tabbar-highlight ((t (:foreground "blue3" :background "gray20" :box (:line-width 1 :color "white" :style nil)))))
     (tabbar-button ((t (:foreground "red4" :bold t :box (:line-width 1 :color "gray20" :style nil)))))
     (tabbar-separator ((t (:foreground "gray20" :background "white" :box (:line-width 1 :color "gray20" :style nil)))))
	 ;; others
	 (zmacs-region ((t (:background "snow" :foreground "blue"))))
     (moccur-face ((t (:background "gray30"))))
     (trailing-whitespace ((t (:background "gray50"))))
     ))
  (term-color-for-twilight))

(provide 'color-theme-twilight)

;;; color-theme-twilight.el ends here
