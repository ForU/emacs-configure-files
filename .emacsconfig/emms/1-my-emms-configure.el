;; ================================================================									
;; Initialize
(add-to-list 'load-path "~/.emacs.d/plugins/emms/") 
(require 'emms-setup)
(require 'emms-info-libtag)
(require 'emms-info)
(require 'emms-player-simple)										
(require 'emms-source-file)
(require 'emms-player-mplayer)
(require 'emms-playing-time)
(require 'emms-playlist-mode)
(require 'emms-mode-line-icon)
(require 'emms-streams)
(require 'emms-stream-info)
(require 'emms-volume)

;; (add-to-list 'load-path "~/.emacs.d/plugins/emms-extension/") 
;; ;; (require 'basic-edit-toolkit)
;; (require 'anything)
;; (require 'anything-emms)
;; (require 'emms-extension)

(emms-standard)
(emms-default-players)

;; ======================music dir===============================
(setq emms-source-file-directory-tree-function 'emms-source-file-directory-tree-find)
(setq emms-info-mp3info-program-name "~/bin/mp3info")
(setq emms-source-file-default-directory "~/Music/")

;;我们希望在用 dired 时可以直接把一个音频文件添加到当前的播放列表中。配置如下：
(setq dired-guess-shell-alist-user
      `((,(regexp-opt
           '(".mp3" ".flv" ".ogg" ".wav" ".avi" ".mpg" ".dat" ".wma" ".asf" ".rmvb"))
         (progn (emms-add-file (dired-get-filename))
                (keyboard-quit)))))
;;这样在 dired 中，按"!"就可以将当前的媒体文件加入到 Emms 的播放列表当中。
(setq emms-playlist-buffer-name "*Music*")
(setq emms-repeat-playlist t)

;; ======================mode line time===============================
;;time:
;;(require 'emms-playing-time)
(emms-playing-time 1)
(emms-playing-time-enable-display)

;;================================================================ 
;;(require 'emms-lyrics)
;;(emms-lyrics 1)
;;that is bad!!!		

;; ;; ;; ======================mplayer video extension=====================
;; (emms-player-set emms-player-mplayer 'regex
;;                  "\\(\\.wav\\|\\.pls+\\|\\.mpg\\|\\.mpeg\\|\\.wmv\\|\\.wma\\|\\.mov\\|\\.avi\\|\\.divx\\|\\.ogm\\|\\.asf\\|\\.mkv\\|http://\\|.rm\\|\\.rmvb\\|\\.mp4\\)$")

;; ======================mplayer audio extension=====================
(emms-player-set emms-player-mplayer 'regex
                 "\\(\\.mp3\\|\\.ogg\\|\\.wma\\)$")


;; ======================func===============================
;; Switch to either the radio buffer or the current EMMS playlist
(defun my-emms-switch-to-current-playlist ()
  (interactive)
  (if (and (boundp 'emms-stream-playlist-buffer)
           (eq emms-stream-playlist-buffer emms-playlist-buffer))
      (switch-to-buffer emms-stream-buffer-name)
    (if (or (null emms-playlist-buffer)
            (not (buffer-live-p emms-playlist-buffer)))
        (error "No current Emms buffer")
      (switch-to-buffer emms-playlist-buffer))))



;;================================================================
;;; Track Show Format (for playlist buffer)

;; (setq emms-last-played-format-alist
;;       '(((emms-last-played-seconds-today) . "%a %H:%M")
;; 	(604800                           . "%a %H:%M") ; this week
;; 	((emms-last-played-seconds-month) . "%d")
;; 	((emms-last-played-seconds-year)  . "%m/%d")
;; 	(t                                . "%Y/%m/%d")))

;; (eval-after-load "emms"
;;   '(progn

;; (setq xwl-emms-playlist-last-track nil)
;; (setq xwl-emms-playlist-last-indent "\\")

;; (defun xwl-emms-track-description-function (track)
;;   "Return a description of the current track."
;;   (let* ((name (emms-track-name track))
;;          (type (emms-track-type track))
;;          (short-name (file-name-nondirectory name))
;;          (play-count (or (emms-track-get track 'play-count) 0))
;;          (last-played (or (emms-track-get track 'last-played) '(0 0 0)))
;;          (empty "..."))
;;     (prog1
;;         (case (emms-track-type track)
;;           ((file url)
;;            (let* ((artist (or (emms-track-get track 'info-artist) empty))
;;                   (year (emms-track-get track 'info-year))
;;                   (playing-time (or (emms-track-get track 'info-playing-time) 0))
;;                   (min (/ playing-time 60))
;;                   (sec (% playing-time 60))
;;                   (album (or (emms-track-get track 'info-album) empty))
;;                   (tracknumber (emms-track-get track 'info-tracknumber))
;;                   (short-name (file-name-sans-extension
;;                                (file-name-nondirectory name)))
;;                   (title (or (emms-track-get track 'info-title) short-name))

;;                   ;; last track
;;                   (ltrack xwl-emms-playlist-last-track)
;;                   (lartist (or (and ltrack (emms-track-get ltrack 'info-artist))
;;                                empty))
;;                   (lalbum (or (and ltrack (emms-track-get ltrack 'info-album))
;;                               empty))

;;                   (same-album-p (and (not (string= lalbum empty))
;;                                      (string= album lalbum))))
;;              (format "%10s  %3d   %-10s%-30s%-20s%-10s%s"
;;                      (emms-last-played-format-date last-played)
;;                      play-count
;;                      artist

;;                      ;; Combine indention, tracknumber, title.
;;                      (concat
;;                       (if same-album-p ; indention by album
;;                           (setq xwl-emms-playlist-last-indent
;;                                 (concat " " xwl-emms-playlist-last-indent))
;;                         (setq xwl-emms-playlist-last-indent "\\")
;;                         "")
;;                       (if (and tracknumber ; tracknumber
;;                                (not (zerop (string-to-number tracknumber))))
;;                           (format "%02d." (string-to-number tracknumber))
;;                         "")
;;                       title        ; title
;;                       )

;;                      ;; album
;;                      (cond ((string= album empty) empty)
;;                            ;; (same-album-p "  ")
;;                            (t (concat "ã€Š" album "ã€‹")))

;;                      (or year empty)
;;                      (if (or (> min 0)  (> sec 0))
;;                          (format "%02d:%02d" min sec)
;;                        empty))))
;;           ((url)
;;            (concat (symbol-name type) ":" name))
;;           (t
;;            (format "%-3d%s"
;;                    play-count
;;                    (concat (symbol-name type) ":" name))))
;;       (setq xwl-emms-playlist-last-track track))))

;; (setq emms-track-description-function
;;       'xwl-emms-track-description-function)

;; ================================================================
;;code ends here.
