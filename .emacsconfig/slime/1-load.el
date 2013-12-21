;; load geiser
(add-to-list 'load-path "~/.emacs.d/plugins/geiser/elisp/")
(require 'geiser)

;; configure slime
(setq inferior-lisp-program "/usr/bin/racket")
(require 'slime-autoloads)
(slime-setup)


