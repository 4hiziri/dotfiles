;; C-h をBackspaceに割り当て
;; (bind-key "C-h" 'delete-backward-char global-map)
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
;;C-q を空けて，C-q C-qにする
(global-unset-key (kbd "C-q"))
(bind-key "C-q C-q" 'quoted-insert global-map)
;; "C-t" でウィンドウを切り替える。初期値はtranspose-chars
(bind-key* "C-t" 'other-window global-map)
;;M-arrow and return
(bind-keys :map input-decode-map
	   ("C-c C-x C-r" . [M-right])
	   ("C-c C-x C-l" . [M-left])
	   ("C-c C-x C-u" . [M-up])
	   ("C-c C-x C-d" . [M-down])
	   ("C-c C-x C-e" . [M-return]))
