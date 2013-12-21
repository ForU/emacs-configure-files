;; ;essential configure:
;; 1. install emacs-w3m develop version (compatible with emacs24):
;; % cvs -d :pserver:anonymous@cvs.namazu.org:/storage/cvsroot login
;; CVS password: # No password is set.  Just hit Enter/Return key.
;; % cvs -d :pserver:anonymous@cvs.namazu.org:/storage/cvsroot co emacs-w3m
;; then configure
(add-to-list 'load-path  "~/.emacs.d/plugins/emacs-w3m/")
(require 'w3m)
