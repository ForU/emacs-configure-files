;; ================================================================
;; window display , cut from ~/.emacs.d/menu_custom.el
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-sources (quote (ac-source-abbrev ac-source-words-in-buffer ac-source-files-in-current-dir ac-source-filename)) t)
 '(comint-completion-addsuffix t)
 '(comint-completion-autolist t)
 '(comint-input-ignoredups t)
 '(comint-move-point-for-output t)
 '(comint-scroll-show-maximum-output t)
 '(comint-scroll-to-bottom-on-input t)
 '(comint-scroll-to-bottom-on-output t)
 '(ecb-layout-window-sizes (quote (("left8" (0.23030303030303031 . 0.26785714285714285) (0.23030303030303031 . 0.23214285714285715) (0.23030303030303031 . 0.26785714285714285) (0.23030303030303031 . 0.21428571428571427)))))
 '(ecb-options-version "2.40"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;; ================================================================
;; http://emacser.com/cedet.htm
(semantic-load-enable-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)
;;(semantic-load-enable-excessive-code-helpers)

;; ================================================================
;; (setq semanticdb-project-roots (list (expand-file-name "/")))
(defconst cedet-user-include-dirs
  (list ".." "../include" "../inc" "../common" "../public"
        "../.." "../../include" "../../inc" "../../common" "../../public"))
(defconst cedet-win32-include-dirs
  (list "C:/MinGW/include"
        "C:/MinGW/include/c++/3.4.5"
        "C:/MinGW/include/c++/3.4.5/mingw32"
        "C:/MinGW/include/c++/3.4.5/backward"
        "C:/MinGW/lib/gcc/mingw32/3.4.5/include"
        "C:/Program Files/Microsoft Visual Studio/VC98/MFC/Include"))
(require 'semantic-c nil 'noerror)
(let ((include-dirs cedet-user-include-dirs))
  (when (eq system-type 'windows-nt)
    (setq include-dirs (append include-dirs cedet-win32-include-dirs)))
  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode))
        include-dirs))


;; ================================================================
;; bookmark
(enable-visual-studio-bookmarks)
(define-key global-map [(control f2)] 'viss-bookmark-toggle)
(define-key global-map [M-f2] 'viss-bookmark-toggle)
(define-key global-map (kbd "ESC <f2>") 'viss-bookmark-toggle) ; putty
(define-key global-map [(f2)] 'viss-bookmark-next-buffer)
(define-key global-map [(shift f2)] 'viss-bookmark-prev-buffer)
(define-key global-map [(control shift f2)] 'viss-bookmark-clear-all-buffer)
;; +F2              set or unset bookmark
;; +C-F2            forward
;; +S-F2            backward
;; +C-S-F2          clear all bookmarks


;; ================================================================
;; switch between h/hpp and c/cpp
(require 'eassist nil 'noerror)
(define-key c-mode-base-map [M-f12] 'eassist-switch-h-cpp)
(setq eassist-header-switches
      '(("h" . ("cpp" "cxx" "c++" "CC" "cc" "C" "c" "mm" "m"))
        ("hh" . ("cc" "CC" "cpp" "cxx" "c++" "C"))
        ("hpp" . ("cpp" "cxx" "c++" "cc" "CC" "C"))
        ("hxx" . ("cxx" "cpp" "c++" "cc" "CC" "C"))
        ("h++" . ("c++" "cpp" "cxx" "cc" "CC" "C"))
        ("H" . ("C" "CC" "cc" "cpp" "cxx" "c++" "mm" "m"))
        ("HH" . ("CC" "cc" "C" "cpp" "cxx" "c++"))
        ("cpp" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
        ("cxx" . ("hxx" "hpp" "h++" "HH" "hh" "H" "h"))
        ("c++" . ("h++" "hpp" "hxx" "HH" "hh" "H" "h"))
        ("CC" . ("HH" "hh" "hpp" "hxx" "h++" "H" "h"))
        ("cc" . ("hh" "HH" "hpp" "hxx" "h++" "H" "h"))
        ("C" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
        ("c" . ("h"))
        ("m" . ("h"))
        ("mm" . ("h"))))

;; ================================================================
;; code folding
(require 'semantic-tag-folding nil 'noerror)
(when (and window-system (require 'semantic-tag-folding nil 'noerror))
  (global-semantic-tag-folding-mode 1)
  (global-set-key (kbd "C-?") 'global-semantic-tag-folding-mode)
  (define-key semantic-tag-folding-mode-map (kbd "M--") 'semantic-tag-folding-fold-block)
  (define-key semantic-tag-folding-mode-map (kbd "M-=") 'semantic-tag-folding-show-block)
  (define-key semantic-tag-folding-mode-map (kbd "C--") 'semantic-tag-folding-fold-all)
  (define-key semantic-tag-folding-mode-map (kbd "C-=") 'semantic-tag-folding-show-all))

