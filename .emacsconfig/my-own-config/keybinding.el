;;======================= f2-f12 =================================
;; f1 ;; global: moccor
;; f2 ;; global: jump
;; f3 ;; global: highlight-symbol
;; f4 ;; C/C++: xcscope; ibus(maybe should be a toggle)
(global-set-key [(f4)] 'ibus-mode)
;; f5 ;; C/C++:  compile
;; f6 ;; C/C++:  debug
;; f7 ;; global: reload-file
;; f8 ;; C/C++: find defined file
(global-set-key [(f8)]          'find-file-at-point)
;; f9 ;; global: man
(global-set-key [(shift f9)]          'woman)
(global-set-key [(control f9)]  'man)
;; view mode
(global-set-key [(f9)]    'view-mode)
 ;; f10;; global: linum
(global-set-key [(f10)]         'global-linum-mode)
(global-set-key [(control f10)] 'linum-mode)
;; (global-set-key [(f10)]         '(lambda() (interactive) (load-file "/usr/local/share/emacs/23.4/lisp/linum.el.gz")(global-linum-mode)))
;; (global-set-key [(control f10)] '(lambda() (interactive) (load-file "/usr/local/share/emacs/23.4/lisp/linum.el.gz")(linum-mode)))
;; f11;; global:
;; 	f11: when ibus-mode on, control ibus
;; f12: global: programconf/lib.el: (jump-to-term "c-term")

;; ================================================================
;; redo:
(define-key global-map (kbd "C-x C-/")  'redo)

;; ;;================================================================
;; ;;Kill Some Buffers
(global-set-key "\C-c\C-b"             'kill-some-buffers)
(define-key global-map "\C-xq"         'query-replace)
(define-key global-map "\C-x\M-q"      'query-replace-regexp)
;;(define-key global-map "\C-xt"         'replace-string)

;;===============================M-x mark TAB TAB=================
;;mark-paragrap:
(global-set-key "\C-xn"                'mark-end-of-sentence)

;;==================== mix keybinding ================================
;;duplicate(复制) a whole line and put it to the next line.
;;http://stackoverflow.com/questions /88399/how-do-i-duplicate-a-whole-line-in-emacs
;;M-m  to move to the first non-whitespace character.
(global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-y\C-p")

;; ================================================================
;;(define-key c-mode-base-map "\C-c\C-t" "\C-a\C- \C-n\M-w\C-y\C-p")
;; this is set as a local key in cc-mode.
;; (global-set-key "\C-cul" "\C-a\C- \C-e\C-x\C-u");;upcase line.
;; (global-set-key "\C-cub" "\C-xh\C-x\C-u");;upcase buffer.
;; (global-set-key "\C-c\C-o" 'capitalize-region);;capitalize region.
;; (global-set-key "\C-ccl" "\C-a\C- \C-e\C-c\C-o");;capitalize line.
;; (global-set-key "\C-ccb" "\C-xh\C-c\C-o");;capitalize buffer.

;;================================================================
;;kill-whole-line:
(global-set-key "\C-h"                 'kill-whole-line)
;;(global-set-key "\C-h"               'backward-delete-char)
(define-key ctl-x-map "?"              'help-command)

;;================================================================
;;info from http://snarfed.org/space/why%20I%20don%27t%20run%20shells%20inside%20Emacs
;;this can be achieve by normal "\C-x\C-f"
;;(global-set-key "\C-xf"              'find-file-at-point)

;;================================================================
(global-set-key "\M-g"                 'goto-line)

;;================================================================
;; the following kbd is from :
;;http://steve.yegge.googlepages.com/effective-emacs
;;================================================================
(global-set-key "\C-w"                 'backward-kill-word)
(global-set-key "\C-x\C-k"             'kill-region)

;; (global-set-key "\C-c\C-k"          'kill-region)
;; (global-set-key "\C-x\C-m"          'execute-extended-command)
;; (global-set-key "\C-c\C-m"          'execute-extended-command)

;;===================C-l and C-xl================================
;; Modified on < Sat Jan  2 23:11:05 2010 >
;; (global-set-key "c-xl"              'count-line-page)  ;; this is default.
;; < C-xC-l is downcase-region >
;; (global-set-key "\C-xl"                'recenter-top-bottom)
(global-set-key "\C-x\C-l"            'recenter-top-bottom)
(global-set-key "\C-\M-l"             'recenter-top-bottom)

;; ;; ================================================================
;; buffer switch

(global-set-key "\C-x\C-p"             'previous-buffer)
(global-set-key "\C-x\C-n"             'next-buffer)

;; ;; window switch
;; (global-set-key "\C-c\C-p"             '(lambda() (interactive)(other-window -1)))
;; (global-set-key "\C-c\C-n"             'other-window)

;; ================================================================
;; winner-mode
;; amazing tools
;; default key:
;; winner-undo: C-c left
;; window-redo: C-c right
(winner-mode 1)
(define-key global-map (kbd "C-<right>")  'winner-redo)
(define-key global-map (kbd "C-<left>")  'winner-undo)

;; ================================================================
;; end here.
;; Sun Apr 24 15:20:26 2011
