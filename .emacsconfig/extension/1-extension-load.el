;; this file is for files in ~/.emacs.d/plugins/extension/
;; all configure about the file in ~/.emacs.d/plugins/extension
;; are put here.

(add-to-list 'load-path "~/.emacs.d/plugins/extension/")
;; (require 'cal-china-x)
;; (require 'echo-pick)
;; (require 'highlight-80+)
(require 'highlight-parentheses)

;;================================================================
;; (require 'dot-mode)

;; ;;dot-mode configure:
;; (require 'dot-mode)
;; (add-hook 'find-file-hooks 'dot-mode-on)

;; following is cut from dot-mode.el
;; If you only want dot-mode to activate when you press "C-.", add the
;; the following to your .emacs:
;;
;;     (autoload 'dot-mode "dot-mode" nil t) ; vi `.' command emulation
;;     (g lobal-set-key [(control ?.)] (lambda () (interactive) (dot-mode 1)
;;                                       (message "Dot mode activated.")))
;;
;; If you want dot-mode all the time (like me), add the following to
;; your .emacs:

;; (require 'dot-mode)
;; (add-hook 'find-file-hooks 'dot-mode-on)
;;
;; You may still want to use the global-set-key above.. especially if you
;; use the *scratch* buffer.
;;
;; To toggle dot mode on or off type `M-x dot-mode'
;;
;; There are only two variables that allow you to modify how dot-mode
;; behaves:
;;           dot-mode-ignore-undo
;;           dot-mode-global-mode
;;
;; dot-mode-ignore-undo - defaults to t.  When nil, it will record keystrokes
;;     that generate an undo just like any other keystroke that changed the
;;     buffer.  I personally find that annoying, but if you want dot-mode to
;;     always remember your undo's:
;;         (setq dot-mode-ignore-undo nil)
;;     Besides, you can always use dot-mode-override to record an undo when
;;     you need to (or even M-x undo).
;;
;; dot-mode-global-mode - defaults to t.  When t, dot-mode only has one
;;     keyboard command buffer.  That means you can make a change in one
;;     buffer, switch buffers, then repeat the change.  When set to nil,
;;     each buffer gets its own command buffer.  That means that after
;;     making a change in a buffer, if you switch buffers, that change
;;     cannot repeated.  If you switch back to the first buffer, your
;;     change can then be repeated again.  This has a nasty side effect
;;     if your change yanks from the kill-ring (You could end up
;;     yanking text you killed in a different buffer).
;;     If you want to set this to nil, you should do so before dot-mode
;;     is activated on any buffers.  Otherwise, you may end up with some
;;     buffers having a local command buffer and others using the global
;;     one.
;;
;; Usage instructions:
;;
;; `C-.'    is bound to dot-mode-execute, which executes the buffer of
;;          stored commands as a keyboard macro.
;;
;; `C-M-.'  is bound to dot-mode-override, which will cause dot-mode
;;          to remember the next keystroke regardless of whether it
;;          changes the buffer and regardless of the value of the
;;          dot-mode-ignore-undo variable.
;;
;; `C-c-.'  is bound to dot-mode-copy-to-last-kbd-macro, which will
;;          copy the current dot mode keyboard macro to the last-kbd-macro
;;          variable.  It can then be executed via call-last-kbd-macro
;;          (normally bound to `C-x-e'), named via name-last-kbd-macro,
;;          and then inserted into your .emacs via insert-kbd-macro.



;;================================================================
(require 'highlight-symbol)
;;keybinding about highlight-symbol:
(global-set-key [(f3)] 'highlight-symbol-at-point)
;;(global-set-key "\M-s h s" 'highlight-regexp) ;; default binding.
(global-set-key [(control f3)] 'highlight-regexp)
(global-set-key [(shift f3)] 'hi-lock-mode)

(global-set-key "\M-n" 'highlight-symbol-next)
(global-set-key "\M-p" 'highlight-symbol-prev)
;;==========================window-numbering======================
(require 'window-numbering)
;; switch windows with:  Alt-[num]
;;window-numbering.el
;;http://nschum.de/src/emacs/window-numbering-mode/
(window-numbering-mode 1)

;; ======================header2===============================
(require 'header2)
;; ======================htmlize===============================
(require 'htmlize)
;;================================================================
(require 'breadcrumb)
;; Examples below assign a set of keys to the breadcrumb bookmark functions.
;; clear the window-manager menu keybinding.Meta-Space for bc-set
(define-key  global-map  [(f2)]                   'bc-set)
(define-key  global-map  [(control f2)]           (lambda()(interactive)(bc-clear)(bc-set)))
;; (define-key  global-map  [(meta    f2)]        'bc-previous)
(define-key  global-map  [(shift   f2)]           'bc-clear)
;; multiple buffer
(define-key  global-map  [(shift meta j)]         'bc-previous)
(define-key  global-map  [(shift meta k)]         'bc-next)
;; local buffer
(define-key  global-map  [(meta j)]               'bc-local-previous)
(define-key  global-map  [(meta k)]               'bc-local-next)
;; others
(define-key  global-map  [(control c)(control j)] 'bc-goto-current)
(define-key  global-map  [(control c)(control l)] 'bc-list)


(defun my-bc-c-mode-hook()
  (interactive)
  (define-key c-mode-base-map [(meta j)] 'bc-local-previous)
  (define-key c-mode-base-map [(meta k)] 'bc-local-next))

(add-hook 'c-mode-common-hook
	  (lambda ()
	    (my-bc-c-mode-hook)))


;; ;; ;================================================================
;; ;; ;doc-mode, this make Emacs basic code highlight crash !!!
;; (require 'doc-mode)
;; (add-hook 'c-mode-common-hook 'doc-mode)

;; ================================================================
;; fringe-helper
(require 'fringe-helper)
(require 'flymake)

(defvar flymake-fringe-overlays nil)
(make-variable-buffer-local 'flymake-fringe-overlays)

(defadvice flymake-make-overlay (after add-to-fringe first
                                (beg end tooltip-text face mouse-face)
                               activate compile)
 (push (fringe-helper-insert-region
        beg end
        (fringe-lib-load (if (eq face 'flymake-errline)
                             fringe-lib-exclamation-mark
                           fringe-lib-question-mark))
        'left-fringe 'font-lock-warning-face)
       flymake-fringe-overlays))

(defadvice flymake-delete-own-overlays (after remove-from-fringe activate
                                       compile)
 (mapc 'fringe-helper-remove flymake-fringe-overlays)
 (setq flymake-fringe-overlays nil))

;;================================================================
;; multiple buffer edit
(require 'color-moccur)
(require 'moccur-edit)
(global-set-key [(f1)] 'moccur)
(global-set-key [(control f1)] 'grep)

;;================================================================
(require 'smex)
        (require 'smex)
        (smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;;================================================================

(require 'minimap)

;;================================================================
(require 'session)
(add-hook 'after-init-hook 'session-initialize)
(load "desktop")
(desktop-load-default)
(desktop-save-mode 1)
(global-unset-key (kbd "C-x C-/"))


;; ================================================================
(require 'redo+)
;; from extension/redo.el (define-key global-map (kbd "C-/")  'undo)
(define-key global-map (kbd "C-x C-_")  'redo)

;; ================================================================
;; end here.
;; 2012-04-24 xiangshou24@gmail.com
		;after sesssion is loaded
					;Caz session bind this key
(define-key global-map (kbd "C-x C-/") 'redo)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ================================================================
;; dictionary site:
;; http://abloz.com/huzheng/stardict-dic/
;; http://abloz.com/huzheng/stardict-dic/dict.org/
;; configure
;; keybindings:
;; (require 'sdcv-mode)
;; (global-set-key [(meta s)] 'sdcv-search)
;; (global-set-key "\M-\S-s" (lambda ()(interactive)(sdcv-search t)))

;; ;; hook
;; (defun my-sdcv-mode-hook()
;;   (interactive)
;;   ;; hl-line-mode
;;   (hl-line-mode 1))
;; (add-hook 'sdcv-mode-hook 'my-sdcv-mode-hook)
;; (setq format-output t)

;; ================================================================
;;code ends here.
