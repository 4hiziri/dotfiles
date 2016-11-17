;;hippie-expand
(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially
	try-complete-file-name
	try-expand-all-abbrevs
	try-expand-dabbrev
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-complete-lisp-symbol-partially
	try-complete-lisp-symbol
	))

(defun my-char-category-regexp (char)
  (let ((c (char-category-set char)))
    (cond
     ((aref c ?a) "\\ca")               ; ASCII
     ((aref c ?j)                       ; Japanese
      (cond
       ((aref c ?K) "\\cK")             ; katakana
       ((aref c ?H) "\\cH")             ; hiragana
       ((aref c ?k) "\\ck")             ; hankaku-kana
       ((aref c ?C) "\\cC")             ; kanji
       ((aref c ?A) "\\cA")             ; 2byte alphanumeric
       ((aref c ?r) "\\cr")             ; Japanese roman ?
       (t "\\cj")))
     ((aref c ?l) "\\cl")               ; Latin
     (t "."))))

;; このコードから借用
;; http://ko.meadowy.net/~shirai/diary/?date=20060125
;; syntax と hippie-expand-dabbrev-as-symbol を使うよう変更。
(defadvice he-dabbrev-beg
    (around modify-regexp-for-japanese activate compile)
  "Dynamically for Japanese words."
  (if (bobp)
      ad-do-it
    (when hippie-expand-dabbrev-skip-space
      (skip-syntax-backward ". "))
    (let ((category-regexp (my-char-category-regexp (char-before)))
	  (syntax-regexp (if hippie-expand-dabbrev-as-symbol
			     "\\sw\\|\\s_" "\\sw")))
      (save-excursion
	(when (> (point) (minibuffer-prompt-end))
	  (forward-char -1)
	  (while (and (looking-at syntax-regexp)
		      (looking-at category-regexp)
		      (> (point) (minibuffer-prompt-end))
		      (not (= (point) (field-beginning (point) nil
						       (1- (point))))))
	    (forward-char -1))
	  (or (and (looking-at category-regexp)
		   (looking-at syntax-regexp))
	      (forward-char 1)))
	(setq ad-return-value (point))))))

;; syntax と category 両方合致するものを検索する
(defun my-he-dabbrev-search-1 (pattern regpat reverse limit)
  (let ((category-regexp (concat (my-char-category-regexp (aref pattern 0))
				 "+")))
    (when (if reverse
	      (re-search-backward regpat limit t)
	    (re-search-forward regpat limit t))
      (if reverse
	  (save-excursion
	    (goto-char (match-beginning 0))
	    (re-search-forward category-regexp (match-end 0) t))
	(goto-char (match-beginning 0))
	(re-search-forward category-regexp (match-end 0) t)))))

;; he-dabbrev-search の再定義。変更個所は [1] [2] [3]
;; 以下の3つの関数から呼ばれる
;; try-expand-dabbrev-visible
;; try-expand-dabbrev
;; try-expand-dabbrev-all-buffers
(defun my-he-dabbrev-search (pattern &optional reverse limit)
  (let ((result ())
	(regpat (cond ((not hippie-expand-dabbrev-as-symbol)
		       (concat "\\<" (regexp-quote pattern) "\\sw+"))
		      ((eq (char-syntax (aref pattern 0)) ?_)
		       (concat (regexp-quote pattern) "\\(\\sw\\|\\s_\\)+"))
		      (t
		       (concat "\\<" (regexp-quote pattern)
			       "\\(\\sw\\|\\s_\\)+")))))
    (while (and (not result)
		;; [1]
		(my-he-dabbrev-search-1 pattern regpat reverse limit))
      (setq result (buffer-substring-no-properties (match-beginning 0)
						   (match-end 0)))
      (if (or (and hippie-expand-dabbrev-as-symbol
		   (> (match-beginning 0) (point-min))
		   (memq (char-syntax (char-after (1- (match-beginning 0))))
			 '(?_ ?w))
		   ;; [2]
		   (eq (char-charset (char-after (1- (match-beginning 0))))
		       'ascii))
	      ;; [3]
	      (<= (length result) (length pattern))
	      (he-string-member result he-tried-table t))
	  (setq result nil))) ; ignore if bad prefix or already in table
    result))
(fset 'he-dabbrev-search 'my-he-dabbrev-search)

;;hippie
(bind-key "C-o" 'hippie-expand)
