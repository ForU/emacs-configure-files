;;http://www.emacswiki.org/emacs/SmartTabs#Retab
;; Add the following code (explained below) to .emacs to make Emacs
;; insert the “right” amount of tabs and spaces automatically. Then,
;; to indent and align, just press ‘<tab>’ for the current line, ‘C-j’
;; for a new line, etc. To retab the entire file, press ‘C-x h C-M-\’
;; (tip: see TabCompletion to do this, too, with the <tab> key).


(require 'smarttabs);; this can be put in ~/.emacs


;; C-like languages
;; For CC Mode (C, C++, Java et al.), add
(setq-default tab-width 4) ; or any other preferred value
(setq cua-auto-tabify-rectangles nil)

(defadvice align (around smart-tabs activate)
  (let ((indent-tabs-mode nil)) ad-do-it))

(defadvice align-regexp (around smart-tabs activate)
  (let ((indent-tabs-mode nil)) ad-do-it))

(defadvice indent-relative (around smart-tabs activate)
  (let ((indent-tabs-mode nil)) ad-do-it))

(defadvice indent-according-to-mode (around smart-tabs activate)
  (let ((indent-tabs-mode indent-tabs-mode))
    (if (memq indent-line-function
	      '(indent-relative
		indent-relative-maybe))
	(setq indent-tabs-mode nil))
    ad-do-it))

(defmacro smart-tabs-advice (function offset)
  (defvaralias offset 'tab-width)
  `(defadvice ,function (around smart-tabs activate)
     (cond
      (indent-tabs-mode
       (save-excursion
	 (beginning-of-line)
	 (while (looking-at "\t*\\( +\\)\t+")
	   (replace-match "" nil nil nil 1)))
       (setq tab-width tab-width)
       (let ((tab-width fill-column)
	     (,offset fill-column))
	 ad-do-it))
      (t
       ad-do-it))))

(smart-tabs-advice c-indent-line c-basic-offset)
(smart-tabs-advice c-indent-region c-basic-offset)


;; The rest of the page assumes the above is already in place.
;; JavaScript
;; For Js2Mode, add
(smart-tabs-advice js2-indent-line js2-basic-offset)

;; Perl
;; For CPerlMode, add
(smart-tabs-advice cperl-indent-line cperl-indent-level)

;; Python
;; For python.el, add
(smart-tabs-advice python-indent-line-1 python-indent)
(add-hook 'python-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode t)
	    (setq tab-width (default-value 'tab-width))))

;; Smart tabs are, of course, fully Python compliant, as the interpreter ignores the leading whitespace of continuation lines. However, in accordance with PEP 8, you should probably use tabs only when maintaining old code.

;; Ruby
;; For RubyMode, add
;; (smart-tabs-advice ruby-indent-line ruby-indent-level)
;; (setq ruby-indent-tabs-mode t)

;; VHDL
;; For VhdlMode, add
;; (smart-tabs-advice vhdl-indent-line vhdl-basic-offset)
;; (setq vhdl-indent-tabs-mode t)
