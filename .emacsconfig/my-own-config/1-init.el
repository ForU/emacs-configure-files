;;================================================================
;;=====THE_BASIC_INITIAL_OPTION(NO_THEME_INCLUDED)====
;;================================================================

;; ================================================================
;; MODE :
(display-time-mode 1)
;;(auto-fill-mode 1)
(ido-mode 1)
;; (icomplete-mode 1)       ;; is good, but some times complicit with ido, so just disable it
(size-indication-mode 1)
(column-number-mode t)      ;;显示列号
(show-paren-mode 1)
(auto-image-file-mode t)    ;; 让emacs可以直接打开和显示图片
(global-font-lock-mode t)   ;; 进行语法加亮

;; ================================================================
;; mark. this make terminal cant handle long output
;; (global-visual-line-mode 1) ;; no indicator in fringe

;; (partial-completion-mode 1) ;;启用部分补全功能，如输入M-x q r r相当于M-x query-replace-regexp
;;(mouse-wheel-mode t)

;; ================================================================
;; very useful !
(fset 'yes-or-no-p 'y-or-n-p)

;; ================================================================
;; SETQ: 
(setq  inhibit-startup-message t
       inhibit-startup-echo-area-message t
       show-trailing-whitespace t
	   indent-tabs-mode nil
       ;; ;;http://infolab.stanford.edu/~manku/dotemacs.html
       ;; ;;reduce the number of messages that appear in the "*Messages*" window
       message-log-max 2048
       kill-ring-max 20
       default-major-mode 'text-mode
       confirm-kill-emacs 'yes-or-no-p
       next-line-add-newlines nil
       require-final-newline nil
       ;;===========================TIME_MAIL============================
       display-time-24hr-format t
       display-time-day-and-date t
       ;; display-time-use-mail-icon nil
	   ;; user-mail-address "xiangshou24@gmail.com"
       ;;==========================TEXT==================================
       ;; ;;80 column wide lines when Fill mode is on
       default-fill-column 80
       ;;=========================DIARY==================================
       ;; Diary
       diary-file "~/Private/diary-file"

       ;;http://nschum.de/src/emacs/
       ;;~/.emacsconfig/need_load_path/
       highlight-parentheses-mode t

       show-paren-style 'parenthesis
       show-paren-delay 0

       ;;http://www.emacswiki.org/emacs/EmacsCrashCode
       make-backup-files t

       ;;================================================================
       ;;http://linux.chinaunix.net/techdoc/system/2008/09/19/1033272.shtml
       ;; bookmark-default-file "~/.emacs.d/.emacs.bmk"
       ;;由菜单修改配置的东西将会保存在custom-file里
       custom-file "~/.emacs.d/menu_custom.el"
       ;;设置gnus启动的文件。默认是为~/.gnus.el
       ;; gnus-init-file "~/.emacsconfig/gnus.el"

       ;;================================================================
       ;; TRASH CONFIGURE
       ;;================================================================
       ;;dired intial configure here.
       ;;info from manual.
       delete-by-moving-to-trash nil
       dired-recursive-deletes t

       ;;To enable the likeness criteria: hit "M-\t"
       flyspell-sort-corrections nil
       ;;since Flyspell considers that a word repeated twice is an  error, this can be disavbed with:
       flyspell-dooublon-as-error-flag nil

       ;;================================================================
       ;; SEARCH CONFIGURE
       search-highlight t
       query-replace-highlight t
       )

;;================================================================
;; Modified on Sun Apr 24 15:59:22 2011
(put 'downcase-region 'disabled nil)
(put 'upcase-region   'disabled nil)
(put 'set-goal-column 'disabled nil)

;; =========================PAREN==================================
(require 'paren)
;; (set-face-background 'show-paren-match-face (face-background 'default))
(set-face-foreground 'show-paren-match-face "white")
(set-face-background 'show-paren-match-face "#73d216")
(set-face-attribute  'show-paren-match-face nil :weight 'extra-bold)

(defadvice show-paren-function
  (after show-matching-paren-offscreen activate)
  "If the matching paren is offscreen, show the matching line in the
    echo area. Has no effect if the character before point is not of
    the syntax class ')'."
  (interactive)
  (let ((matching-text nil))
    ;; Only call `blink-matching-open' if the character before point
    ;; is a close parentheses type character. Otherwise, there's not
    ;; really any point, and `blink-matching-open' would just echo
    ;; "Mismatched parentheses", which gets really annoying.
    (if (char-equal (char-syntax (char-before (point))) ?\))
	(setq matching-text (blink-matching-open)))
    (if (not (null matching-text))
	(message matching-text))))

(defun my-widget-kill()
  (interactive)
  (menu-bar-mode 0)
  (tool-bar-mode 0)
  (scroll-bar-mode 0))

;; default setting here
(tool-bar-mode 0)

;; set off ring bell
;; http://www.emacswiki.org/emacs/AlarmBell#toc2
;; (setq ring-bell-function 'ignore)
(setq ring-bell-function
      (lambda ()
	(call-process-shell-command "xset led 3; xset -led 3" nil 0 nil)))

;; ================================================================
(setq default-directory "~")

;; ================================================================
;; end here.
;; 2012-05-18 xiangshou24@gmail.com
