(require 'xcscope)

;; ;; update database
;; (setq cscope-do-not-update-database nil)

;; ################################################################
;; key binding
;; C/C++
(defun my-cscope-c-common-mode-hook()
  (interactive)
  (define-key c-mode-base-map [(f4)]               'cscope-find-global-definition-no-prompting)
  (define-key c-mode-base-map [(control shift f4)] 'cscope-find-global-definition)
  (define-key c-mode-base-map [(control f4)]       'cscope-find-this-symbol)
  (define-key c-mode-base-map [(shift f4)]         'cscope-find-this-text-string)
  ;;(define-key c-mode-base-map "\M-j"              'cscope-next-symbol)
  ;;(define-key c-mode-base-map "\M-k"              'cscope-prev-symbol)
  )

(global-set-key [(f4)]               'cscope-find-global-definition-no-prompting)
(global-set-key [(control shift f4)] 'cscope-find-global-definition)
(global-set-key [(control f4)]       'cscope-find-this-symbol)
(global-set-key [(shift f4)]         'cscope-find-this-text-string)

;; cscope-self
(defun my-cscope-self-mode-hook()
  (interactive)
  (define-key cscope-list-entry-keymap "d"   'cscope-find-global-definition-no-prompting)
  (define-key cscope-list-entry-keymap "D"   'cscope-find-global-definition)
  (define-key cscope-list-entry-keymap "s"   'cscope-find-this-symbol)
  (define-key cscope-list-entry-keymap "t"   'cscope-find-this-text-string)
  (define-key cscope-list-entry-keymap "o"   'cscope-select-entry-other-window)
  (define-key cscope-list-entry-keymap "RET" 'cscope-select-entry-other-window)
  ;; file
  (define-key cscope-list-entry-keymap "h"   'cscope-next-file)
  (define-key cscope-list-entry-keymap "l"   'cscope-prev-file)
  ;; self-view, without toggle c-stuff
  (define-key cscope-list-entry-keymap "H"   'backward-paragraph)
  (define-key cscope-list-entry-keymap "L"   'forward-paragraph)
  ;; hide away
  (define-key cscope-list-entry-keymap "0"   'delete-window)
  (define-key cscope-list-entry-keymap "q"   'delete-window)
  ;; file
  (define-key cscope-list-entry-keymap "n"   'cscope-next-file)
  (define-key cscope-list-entry-keymap "p"   'cscope-prev-file)
  ;; symbol
  (define-key cscope-list-entry-keymap "j"   'cscope-next-symbol)
  (define-key cscope-list-entry-keymap "k"   'cscope-prev-symbol)
  )

;; add-hook
(add-hook 'c-mode-common-hook 'my-cscope-c-common-mode-hook)
(add-hook 'python-mode-hook 'my-cscope-c-common-mode-hook)
(add-hook 'cscope-list-entry-hook 'my-cscope-self-mode-hook)

;; ================================================================
;; end here.
;; Mon Apr 16 12:36:43 2012
