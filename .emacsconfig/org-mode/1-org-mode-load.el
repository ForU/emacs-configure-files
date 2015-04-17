;; It is needed so that Emacs can autoload functions that are located in files not
;; immediately loaded when Org-mode starts.
;; (add-to-list 'load-path "~/.emacs.d/plugins/org-mode/lisp/")
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\)$" . org-mode))
(require 'org-install)

(add-hook 'org-mode-hook
          (lambda ()
            ;; yasnippet
            (make-variable-buffer-local 'yas/trigger-key)
            (org-set-local 'yas/trigger-key [tab])
            (define-key yas/keymap [tab] 'yas/next-field-group)
            ;; flyspell mode for spell checking everywhere
            (flyspell-mode 1)
            ;; Undefine C-c [ and C-c ] since this breaks my org-agenda files when directories
            ;; are include. It expands the files in the directories individually
            (org-defkey org-mode-map "\C-c[" 'undefined)
            (org-defkey org-mode-map "\C-c]" 'undefined)

            ;; keybinding
            (define-key org-mode-map "\C-cl" 'org-store-link)
            (define-key org-mode-map "\C-ca" 'org-agenda)
            (define-key org-mode-map "\C-cb" 'org-iswitchb)
            (local-set-key (kbd "C-c M-o") 'bh/mail-subtree)))

;; experimenting with docbook exports - not finished
;;(setq org-export-docbook-xsl-fo-proc-command "fop %s %s")
;;(setq org-export-docbook-xslt-proc-command "xsltproc --output %s ~/Documents/xml/docbook/stylesheet/nwalsh/fo/docbook.xsl %s")
