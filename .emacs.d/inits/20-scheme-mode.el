;; 別のウィンドウに gosh を動作させる
(defun scheme-other-window ()
  "Run Gauche on other window"
  (interactive)
  (split-window-horizontally (/ (frame-width) 2))
  (let ((buf-name (buffer-name (current-buffer))))
    (scheme-mode)
    (switch-to-buffer-other-window
     (get-buffer-create "*scheme*"))
    (run-scheme scheme-program-name)
    (switch-to-buffer-other-window
     (get-buffer-create buf-name))))

(define-key global-map "\C-cS" 'scheme-other-window)

;; UTF-8 に統一
(setq process-coding-system-alist
      (cons '("gosh" utf-8 . utf-8) process-coding-system-alist))

(use-package scheme-mode
  :straight nil
  :defer t)

(use-package run-scheme
  :straight nil
  :defer t
  :init (setq scheme-program-name "gosh -i"))

;(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
;(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)

