;;; rainbow-delimiters --- color ()
;;; Commentary:
;;; Code:

(use-package color
  :ensure nil)
(use-package cl-lib
  :ensure nil)

;; AI code, fuck
(defun rainbow-delimiters-using-stronger-colors ()
  "rainbow-delimitersの各Faceの彩度を最大(100%)に高める。"
  (interactive)
  (cl-loop
   for index from 1 to rainbow-delimiters-max-face-count
   do
   (let* ((face (intern (format "rainbow-delimiters-depth-%d-face" index)))
          (current-color (face-foreground face)))
     (when current-color
       (let* ((rgb (color-name-to-rgb current-color))
              (hsl (apply #'color-rgb-to-hsl rgb))
              ;; 彩度(2番目の要素)を 1.0 (100%) に上書き
              (stronger-hsl (list (car hsl) 1.0 (nth 2 hsl)))
              (new-hex (apply #'color-rgb-to-hex (apply #'color-hsl-to-rgb stronger-hsl))))
         (set-face-foreground face new-hex))))))

(use-package rainbow-delimiters
  :hook
  prog-mode
  :config
  (rainbow-delimiters-using-stronger-colors))

;;; 10-rainbow-delimiters.el ends here
