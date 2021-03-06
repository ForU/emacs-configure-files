;; ================================================================
(add-to-list 'load-path
			 "~/.emacs.d/plugins/yasnippet")

(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")

;; ================================================================
;; keybinding here.
;; cut from yasnippet.el and get modified
;; ;; Now for the stuff that has direct keybindings
(define-key yas/keymap (kbd  "\C-c&\C-s") 'yas/insert-snippet)
(define-key yas/keymap (kbd  "\C-c&\C-n") 'yas/new-snippet)
(define-key yas/keymap (kbd  "\C-c&\C-v") 'yas/visit-snippet-file)
(define-key yas/keymap (kbd  "\C-c&\C-f") 'yas/find-snippets)


(require 'dropdown-list)
(setq yas/prompt-functions '(yas/dropdown-prompt
							 yas/ido-prompt
							 yas/completing-prompt))

(define-key yas/keymap [tab] 'yas/next-field)
