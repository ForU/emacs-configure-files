;;================================================================
;;=============================emms-keybinding====================
;;================================================================ 
;;================================================================ 
;;(require 'emms-lyrics)
;;(emms-lyrics 1)
;;(global-set-key "\C-cel" 'emms-lyrics-toggle-display-on-minibuffer)
;;(global-set-key "\C-cem" 'emms-lyrics-toggle-display-on-modeline)

;;================================================================

(global-set-key (kbd "C-<down>")  'emms-next)
(global-set-key (kbd "C-<up>")    'emms-previous)
;; (global-set-key (kbd "C-<right>") 'emms-volume-raise)
;; (global-set-key (kbd "C-<left>")  'emms-volume-lower)

(define-key mode-specific-map (kbd "e A")     'emms-add-dired)
(define-key mode-specific-map (kbd "e a")     'emms-add-directory)
(define-key mode-specific-map (kbd "e c")     'emms-playlist-current-clear)
(define-key mode-specific-map (kbd "e D")     'emms-play-directory-tree)
(define-key mode-specific-map (kbd "e d")     'emms-play-directory)
(define-key mode-specific-map (kbd "e M")     'emms-mode-line-toggle)
(define-key mode-specific-map (kbd "e m")     'emms-play-matching)
(define-key mode-specific-map (kbd "e f")     'emms-add-find)
(define-key mode-specific-map (kbd "e g")     'emms-playlist-mode-go)
(define-key mode-specific-map (kbd "e j")     'emms-seek)
(define-key mode-specific-map (kbd "e <right>") (lambda()(interactive)(emms-seek 30)))
(define-key mode-specific-map (kbd "e <left>") (lambda()(interactive)(emms-seek -15)))
(define-key mode-specific-map (kbd "e n")     'emms-next)
(define-key mode-specific-map (kbd "e p")     'emms-previous)
(define-key mode-specific-map (kbd "e =")     'emms-volume-raise)
(define-key mode-specific-map (kbd "e -")     'emms-volume-lower)
(define-key mode-specific-map (kbd "e r")     'emms-random)
(define-key mode-specific-map (kbd "e s")     'emms-shuffle)
(define-key mode-specific-map (kbd "e S")     'emms-stop)
(define-key mode-specific-map (kbd "e t")     'emms-toggle-repeat-track)
(define-key mode-specific-map (kbd "e P")     'emms-toggle-repeat-playlist)
(define-key mode-specific-map (kbd "e <SPC>") 'emms-pause)

;;emms-playlist-mode
(define-key emms-playlist-mode-map (kbd "A")     'emms-add-dired)
(define-key emms-playlist-mode-map (kbd "a")     'emms-add-directory)
(define-key emms-playlist-mode-map (kbd "<SPC>") 'emms-pause)

(define-key emms-playlist-mode-map (kbd "D")     'emms-play-directory-tree)
(define-key emms-playlist-mode-map (kbd "d")     'emms-play-directory)

(define-key emms-playlist-mode-map (kbd "b")     '(lambda()(interactive)(emms-seek -30)))
(define-key emms-playlist-mode-map (kbd ",")     '(lambda()(interactive)(emms-seek -30)))
(define-key emms-playlist-mode-map (kbd "f")     '(lambda()(interactive)(emms-seek +30)))
(define-key emms-playlist-mode-map (kbd ".")     '(lambda()(interactive)(emms-seek +30)))

(define-key emms-playlist-mode-map (kbd "j") "\C-n")
(define-key emms-playlist-mode-map (kbd "k") "\C-p")
;; "k" is default for (emms-playlist-current-kill)

(define-key emms-playlist-mode-map (kbd "h")     'emms-volume-raise)
(define-key emms-playlist-mode-map (kbd "=")     'emms-volume-raise)
(define-key emms-playlist-mode-map (kbd "l")     'emms-volume-lower)
(define-key emms-playlist-mode-map (kbd "-")     'emms-volume-lower)
(define-key emms-playlist-mode-map (kbd "t")     'emms-toggle-repeat-track)
