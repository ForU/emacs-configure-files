;; ////////////////////////////////////////////////////////////////
;; modify ~/.emacs.d/plugins/ecb-2.40/ecb-mode-line.el
;; for format "W-%d" compatible with winner-mode

;; ////////////////////////////////////////////////////////////////
(add-to-list 'load-path  "~/.emacs.d/plugins/ecb-2.40")
(require 'ecb)

;; ////////////////////////////////////////////////////////////////
;; refer to ~/.emacs.d/plugins/ecb-2.40/ecb-layout-defs.el 
(ecb-layout-define "none" left
  ;;(select-window (selected-window))
  (delete-window (selected-window))
  (message "none")
 )

(ecb-layout-define "simple" left
  (select-window (selected-window))
  (ecb-set-methods-buffer)
  (select-window (next-window)))

(ecb-layout-define "mix" left-right
  "This function creates the following layout:
   --------------------------------------------------------------
   |              |                               |             |
   |  Directories |                               |  Methods    |
   |              |                               |             |
   |              |                               |             |
   |              |                               |             |
   |              |                               |             |
   |              |                               |             |
   |--------------|             Edit              |             |
   |              |                               |             |
   |  Sources     |                               |             |
   |              |                               |             |
   |--------------|                               |             |
   |              |                               |             |
   |  History     |                               |             |
   |              |                               |             |
   --------------------------------------------------------------
If you have not set a compilation-window in `ecb-compile-window-height' then
the layout contains no persistent compilation window and the other windows get a
little more place."
  (ecb-set-directories-buffer)
  (ecb-split-ver 0.4)
  (ecb-set-sources-buffer)
  ;;(ecb-split-ver 0.5)
  ;;(ecb-set-history-buffer)
  (select-window (next-window (next-window)))
  (ecb-set-methods-buffer)
  (select-window (previous-window (selected-window) 0)))

;; control the width portion verticall-split windows
(set-default 'ecb-windows-width 0.25)

(ecb-layout-define "code" left-right
 "This function creates the following layout:

   --------------------------------------------------------------
   |              |                               |             |
   |  Directories |                               |  Methods    |
   |              |                               |             |
   |              |                               |             |
   |              |                               |             |
   |              |                               |             |
   |              |                               |             |
   |--------------|             Edit              |-------------|
   |              |                               |             |
   |  Sources     |                               |  History    |
   |              |                               |             |
   |              |                               |             |
   |              |                               |             |
   |              |                               |             |
   |              |                               |             |
   --------------------------------------------------------------
   |                                                            |
   |                    Compilation                             |
   |                                                            |
   --------------------------------------------------------------

If you have not set a compilation-window in `ecb-compile-window-height' then
the layout contains no persistent compilation window and the other windows get a
little more place."
 (ecb-set-directories-buffer)
 (ecb-split-ver 0.4)
 (ecb-set-sources-buffer)
 (select-window (next-window (next-window)))
 (ecb-set-methods-buffer)
 ;; (ecb-split-ver 0.9)
 ;; (ecb-set-history-buffer)
 (select-window (previous-window (previous-window (selected-window) 0) 0)))

;; ////////////////////////////////////////////////////////////////
;; basic configure
;; to enable ecb compilation window, just set ecb-compile-window-height
(setq  stack-trace-on-error t
	   ecb-tip-of-the-day nil
	   ecb-layout-name "simple"
       ecb-auto-expand-tag-tree t
       ecb-auto-expand-tag-tree-old t
       ;; ecb-compile-window-height 10     ;show compile window if needed
       ecb-compile-window-width 'frame ;;'frame(default) or 'edit-window
       )

;; ////////////////////////////////////////////////////////////////
;; menu:ECB->Layout administration->store current-window sizes
;; file: ~/.emacs.d/menu_custom.el
;; ////////////////////////////////////////////////////////////////
