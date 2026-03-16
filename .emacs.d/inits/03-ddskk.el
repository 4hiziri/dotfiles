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
  (skk-extra-jisyo-file-list
   (list (expand-file-name "~/.config/skk/user.dict")))
  (skk-server-coding-system 'utf-8)
  (skk-tooltip-parameters
        '((background-color . "#323445")))

  ;; ;; 半角で入力したい文字
  (skk-rom-kana-rule-list
   (nconc '(("ca" nil "か")
            ("ci" nil "か")
            ("cu" nil "か")
            ("ce" nil "か")
            ("co" nil "か")
            ("cya" nil "きゃ")
            ("cyi" nil "きぃ")
            ("cyu" nil "きゅ")
            ("cye" nil "きぇ")
            ("cyo" nil "きょ")
            (";" nil nil)
            (":" nil nil)
            ("?" nil nil)
            ("!" nil nil)
            ("'" nil nil)
            ("\"" nil nil)
            ("(" nil nil)
            (")" nil nil))))
  :config
  (require 'context-skk))

(use-package ddskk-postframe
  :after ddskk
  :ensure (:host github
                 :repo "conao3/ddskk-posframe.el"
                 :main "ddskk-posframe.el")
  :config
  (ddskk-postframe-mode 1))
