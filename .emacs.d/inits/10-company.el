;;; 10-company.el --- company conf
;;; Commentary:
;; :TODO check key bind works
;; M-n 次の候補選択
;; M-p 前の候補選択
;; C-g 候補選択中止
;; RET 候補選択
;; F1, C-h docを別バッファに表示
;; C-w 定義場所を表示
;; C-s 候補検索
;; C-M-s 候補フィルタリング
;; [tab] 共通するprefixを挿入
;;; Code:

;; (add-hook 'after-init-hook 'company-statistics-mode) ;; bug!

(use-package company
  :defer t
  :init
  (global-company-mode 1)
  :bind
  (()
   :map company-active-map
   ("C-n" . company-select-next)
   ("C-p" . company-select-previous)
   ("C-d" . company-show-doc-buffer)
   ("M-." . company-show-location))

  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2)
  (setq company-selection-wrap-around t)
  ;; (bind-key "C-n" 'company-select-next company-active-map)
  ;; (bind-key "C-p" 'company-select-previous company-active-map)
  ;; (bind-key "C-d" 'company-show-doc-buffer company-active-map)
  ;; (bind-key "M-." 'company-show-location company-active-map)
  (defun company--insert-candidate2 (candidate)
    (when (> (length candidate) 0)
      (setq candidate (substring-no-properties candidate))
      (if (eq (company-call-backend 'ignore-case) 'keep-prefix)
		  (insert (company-strip-prefix candidate))
		(if (equal company-prefix candidate)
			(company-select-next)
          (delete-region (- (point) (length company-prefix)) (point))
		  (insert candidate))
		)))

  (defun company-complete-common2 ()
    (interactive)
    (when (company-manual-begin)
      (if (and (not (cdr company-candidates))
			   (equal company-common (car company-candidates)))
		  (company-complete-selection)
		(company--insert-candidate2 company-common))))

  (define-key company-active-map [tab] 'company-complete-common2))

;;; 10-company.el ends here
