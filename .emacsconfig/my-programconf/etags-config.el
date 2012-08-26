;; ;;http://www.emacswiki.org/emacs/BuildTags

(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command 
   (format "find %s -type f -name \"*.[ch]\" | etags -L -" dir-name)))
