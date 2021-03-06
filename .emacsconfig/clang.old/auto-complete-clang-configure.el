;; must needed:
(add-to-list 'load-path "~/.emacs.d/plugins/clang")
(require 'auto-complete-clang)
(setq clang-completion-suppress-error 't)

(defun my-c-mode-common-hook()
										;  (setq ac-auto-start nil)
  (setq ac-expand-on-auto-complete nil)
  (setq ac-quick-help-delay 0.3)
  )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;;================================================================
(add-hook 'c-mode-common-hook
          (lambda ()
            ;; or (if ac-mode is on)
			(local-set-key "\M-l" (quote ac-complete-clang))))



;;================================================================
;; https://github.com/brianjcj/auto-complete-clang
;; (add-to-list 'load-path (concat myoptdir "AC"))
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories (concat myoptdir "AC/ac-dict"))

;; (require 'auto-complete-clang)

;; (setq ac-auto-start nil)
;; (setq ac-quick-help-delay 0.5)
;; ;; (ac-set-trigger-key "TAB")
;; ;; (define-key ac-mode-map  [(control tab)] 'auto-complete)
;; (define-key ac-mode-map  [(control tab)] 'auto-complete)
;; (defun my-ac-config ()
;;   (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
;;   (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
;;   ;; (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
;;   (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
;;   (add-hook 'css-mode-hook 'ac-css-mode-setup)
;;   (add-hook 'auto-complete-mode-hook 'ac-common-setup)
;;   (global-auto-complete-mode t))
;; (defun my-ac-cc-mode-setup ()
;;   (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
;; (add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
;; ;; ac-source-gtags
;; (my-ac-config)

;;================================================================
;; system std header file location
(setq ac-clang-flags
      (mapcar (lambda (item)(concat "-I" item))
              (split-string
               "
	 /usr/include/c++/4.6
	 /usr/include/c++/4.6/i686-linux-gnu/.
	 /usr/include/c++/4.6/backward
	 /usr/lib/gcc/i686-linux-gnu/4.6.1/include
	 /usr/local/include
	 /usr/lib/gcc/i686-linux-gnu/4.6.1/include-fixed
	 /usr/include/i386-linux-gnu
	 /usr/include
        "
               )))



;; ================================================================
;; end here.
;; 2012-05-18 xiangshou24@gmail.com
