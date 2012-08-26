;; ================================================================
(add-to-list 'load-path "~/.emacs.d/plugins/extension/")
;; ================================================================
;; basic color configure
(require 'tabbar)
;; (tabbar-mode 1)
;; Tabbar settings
(set-face-attribute
 'tabbar-default nil
 :background "gray20"
 :foreground "gray20"
 :box '(:line-width 1 :color "gray20" :style nil)
 :underline t
 :height 0.8 )
(set-face-attribute
 'tabbar-unselected nil
 :background "gray20"
 :foreground "white"
 :box '(:line-width 1 :color "gray30" :style nil)
 :height 1.0 )
(set-face-attribute
 'tabbar-selected nil
 :background "gray75"
 :foreground "blue3"
 :bold t
 :box '(:line-width 1 :color "gray75" :style nil)
 :height 1.0 )
(set-face-attribute
 'tabbar-highlight nil
 :background "gray20"
 :foreground "black"
 :underline t
 :box '(:line-width 1 :color "white" :style nil)
 :height 0.8 )
(set-face-attribute
 'tabbar-button nil
 :bold t
 :box '(:line-width 1 :color "gray20" :style nil)
 :height 0.8 )
(set-face-attribute
 'tabbar-separator nil
 :background "gray20"
 :height 0.6
 :underline t
 )

;; ================================================================
;; key mapping
;; tabbar-mode
;; amazing tools
;; default key: ;; C-c C-left ;; C-c C-right
;; unset key
(if tabbar-mode
    (local-unset-key (kbd "<right>"))
  (local-unset-key (kbd "<left>"))
  (local-unset-key (kbd "<down>"))
  (local-unset-key (kbd "<up>"))
  (local-unset-key (kbd "M-<down>"))
  (local-unset-key (kbd "M-<up>")))
;; tab
(define-key tabbar-mode-map (kbd "<right>") 'tabbar-forward-tab)
(define-key tabbar-mode-map (kbd "<left>")  'tabbar-backward-tab)
(define-key tabbar-mode-map [(control ?\,)] 'tabbar-backward-tab)
(define-key tabbar-mode-map [(control ?\.)] 'tabbar-forward-tab)
;; group
(define-key tabbar-mode-map (kbd "<down>")  'tabbar-forward-group)
(define-key tabbar-mode-map (kbd "<up>")    'tabbar-backward-group)
(define-key tabbar-mode-map (kbd "M-.")     'tabbar-forward-group)
(define-key tabbar-mode-map (kbd "M-,")     'tabbar-backward-group)

;; ================================================================
;; ends
