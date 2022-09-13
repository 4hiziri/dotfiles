;;; org-mode --- org-mode conf
;;; Commentary:
;; C-c C-p 前の見出し行へ
;; C-c C-n 後の見出し行へ
;; C-c C-b 同レベルの前の見出し行へ
;; C-c C-f 同レベルの後の見出し行へ
;; C-c C-u 1階層上の見出し行へ
;; C-i (TAB) 現在の見出し以下を折り畳む・表示する
;;           見出し以下を隠す
;;           下位見出しを表示する
;;           全体を表示する
;;           1へ戻る
;; C-u C-i (S-TAB) 文書全体の見出しのみを表示・全部表示
;;                 最上位の見出しのみを表示する
;;                 すべての見出しを表示する
;;                 全体を表示する
;;                 1へ戻る
;; M-x org-store-link
;; (global-set-key (kbd "C-c l") 'org-store-link)
;; C-c C-l
;;
;; active日時 C-c .	org-agendaで表示される日時
;; inactive日時	C-c ! org-agendaで表示されない日時
;; 行動予定日時	C-c C-s	そのタスクを行う予定の日時
;; 〆切日時	C-c C-d	〆切の日時
;; C-c C-t 次のラベル
;; C-c C-c サブタスクカウント更新
;; M--> level up
;; M-<- level down
;;
;; timer
;; org-timer -> タイマー
;; org-clock -> 時刻
;; C-c . ---> <2012-11-16 金>
;; C-u C-c . ---> <2012-11-16 金 22:11>
;; C-c C-x ; org-timer-set-timer カウントダウンタイマーをやってくれる
;; C-c C-x C-i logging start time
;; C-c C-x C-o logging stop time
;;
;; C-c C-x r 見出しを深くする、それ以外にも
;; C-c C-x l 見出しを浅くする、それ以外にも
;; M-x org-info RET open manual
;;
;; org-refile
;;
;; tag
;; C-c C-q add new tag to headline
;; C-c C-c can edit tag
;; C-c / m or C-c \ tag search
;; M-x org-agenda m Create a global list of tag matches from all agenda files. See Matching Tags and Properties.
;; M-x org-agenda M Create a global list of tag matches from all agenda files, but check only TODO items and force checking subitems
;;
;; ref
;; https://qiita.com/zonkyy/items/821ea2b1e20f575c222f#%E7%B7%A0%E3%82%81%E5%88%87%E3%82%8A%E3%82%84%E4%BD%9C%E6%A5%AD%E4%BA%88%E5%AE%9A%E6%97%A5%E3%81%AE%E7%AE%A1%E7%90%86
;; https://orgmode.org/manual/Breaking-Down-Tasks.html
;; https://orgmode.org/worg/orgcard.html
;;; Code:

(use-package org
  :defer t
  :bind (("C-c c" . org-capture)
		 ("C-c a" . org-agenda)
		 :map org-mode-map
		 ([M-return] . org-insert-heading-dwim))
  :init
  (setq org-agenda-files (list "~/misc/memos/"))
  (setq org-capture-templates
		'(("t" "New TODO" entry
		   (file+headline "~/misc/memos/TODO.org" "todo list")
		   "* TODO %?\n\n")
		  ("m" "Memo" entry
		   (file+headline "~/misc/memos/memo.org" "Memo")
		   "* %U%?\n%i\n%a")))
  ;; org-agendaでaを押したら予定表とTODOリストを表示
  (setq org-agenda-custom-commands
		'(("a" "Agenda and TODO"
		   ((agenda "")
			(alltodo "")))))
  ;; sample
  ;; (setq org-agenda-custom-commands
  ;; 		'(
  ;;         ("o" . "Original agenda view") ; description for "o" prefix
  ;;         ("ot" todo "TODO")
  ;;         ))
  ;; org-agendaで扱うファイルは複数可だが、
  ;; TODO・予定用のファイルのみ指定
  (setq org-agenda-files '("~/misc/memos/TODO.org"))
  ;; TODOリストに日付つきTODOを表示しない
  (setq org-agenda-todo-ignore-with-date t)
  ;; 今日から予定を表示させる
  (setq org-agenda-start-on-weekday nil)
  ;; Doneにした時刻を記録
  (setq org-log-done 'time)
  :config
  (defun org-insert-upheading (arg)
	(interactive "P")
	(org-insert-heading arg)
	(cond ((org-on-heading-p) (org-do-promote))
		  ((org-at-item-p) (org-indent-item -1))))
  (defun org-insert-heading-dwim (arg)
	(interactive "p")
	(case arg
		  (4 (org-insert-subheading nil))
		  (16 (org-insert-upheading nil))
		  (t (org-insert-heading nil))))
  ;; (bind-key [M-return] 'org-insert-heading-dwim org-mode-map)
  (setq org-clock-into-drawer t)
  ;; (setq org-tag-alist '(("@work" . ?w) ("@home" . ?h) ("laptop" . ?l))) ;; set shortcut for tag
  ;; or #+TAGS: @work(w)  @home(h)  @tennisclub(t)  laptop(l)  pc(p)
  )

;;; 20-org-mode.el ends here
