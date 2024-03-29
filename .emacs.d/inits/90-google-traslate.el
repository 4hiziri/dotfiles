;;; google-translate --- translate
;;; Commentary:
;; FIXME:
;;; Code:

(use-package google-translate
  :ensure t
  :init
  (require 'facemenu)
  (require 'google-translate-default-ui)
  (setq google-translate-backend-method 'curl)
  (defun google-translate--search-tkk () "Search TKK." (list 430675 2721866130))
  (defvar google-translate-english-chars "[:ascii:]’“”–"
    "これらの文字が含まれているときは英語とみなす")
  (defun google-translate-enja-or-jaen (&optional string)
    "regionか、現在のセンテンスを言語自動判別でGoogle翻訳する。"
    (interactive)
    (setq string
	  (cond ((stringp string) string)
		(current-prefix-arg
		 (read-string "Google Translate: "))
		((use-region-p)
		 (buffer-substring (region-beginning) (region-end)))
		(t
		 (save-excursion
		   (let (s)
		     (forward-char 1)
		     (backward-sentence)
		     (setq s (point))
		     (forward-sentence)
		     (buffer-substring s (point)))))))
    (let* ((asciip (string-match
		    (format "\\`[%s]+\\'" google-translate-english-chars)
		    string)))
      (run-at-time 0.1 nil 'deactivate-mark)
      (google-translate-translate
       (if asciip "en" "ja")
       (if asciip "ja" "en")
       string)))
  :bind (("C-c t" . google-translate-enja-or-jaen)))

;; FIXME typo filename
;;; 90-google-translate.el ends here
