(use-package ccc
  :ensure (:repo "skk-dev/ddskk"
                 :files ("ccc.el")
                 :version (lambda (_) "1.43")))

(use-package ddskk
  :after ccc
  :ensure (:version (lambda (_) "17.1"))
  :hook ((find-file-hooks . (lambda () (skk-latin-mode 1))))
  :custom
  (default-input-method "japanese-skk")
  (skk-comp-mode t)
  (skk-auto-insert-paren t)
  (skk-delete-implies-kakutei nil)
  (skk-sticky-key ";")
  (skk-henkan-strict-okuri-precedence t)
  (skk-show-annotation t) ;; 単語の意味をアノテーションとして表示
  (skk-compare-jisyo-size-when-saving nil)
  (skk-server-host "127.0.0.1")
  (skk-server-portnum 1178)
  (skk-jisyo "~/.config/skk/user.dict") ;; 個人辞書の設定
  (skk-tooltip-parameters
   '((background-color . "#323445")))
  :config
  (require 'context-skk)
  (require 'skk-server)
  ;; EUCハードコードされているので暫定対応
  (skk-open-server)
  (set-process-coding-system (get-process "skkservd") 'utf-8 'utf-8)

  ;; 半角で入力したい文字など
  (nconc skk-rom-kana-rule-list
         '(("ca" nil ("カ" . "か"))
           ("ci" nil ("キ" . "き"))
           ("cu" nil ("ク" . "く"))
           ("ce" nil ("ケ" . "け"))
           ("co" nil ("コ" . "こ"))
           ("cya" nil ("キャ" . "きゃ"))
           ("cyi" nil ("キィ" . "きぃ"))
           ("cyu" nil ("キュ" . "きゅ"))
           ("cye" nil ("キェ" . "きぇ"))
           ("cyo" nil ("キョ" . "きょ"))
           (";" nil nil)
           (":" nil nil)
           ("?" nil nil)
           ("!" nil nil)
           ("'" nil nil)
           ("\"" nil nil)
           ("(" nil nil)
           (")" nil nil))))
