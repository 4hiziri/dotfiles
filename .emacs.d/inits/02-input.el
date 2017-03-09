;;; 02-input.el --- Summary
;;; Commentary:
;; setting for input method
;; now, adopt skk

;;; Code:
;; 日本語の設定
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq buffer-file-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)

(use-package skk
  :defer t
  :init
  (setq default-input-method "japanese-skk")         ;;emacs上での日本語入力にskkをつかう
  :config
  (bind-key "C-x j" 'skk-auto-fill-mode) ;;良い感じに改行を自動入力してくれる機能
  ;; (global-set-key (kbd "C-x j") 'skk-auto-fill-mode)  
  (setq skk-isearch-start-mode `latin)
  (setq skk-minibuffer-origin-mode `latin)
  (setq skk-display-code-method nil)
  (require 'skk-study)
  (require 'context-skk)

  ;; 辞書の設定
  (setq skk-large-jisyo "~/.emacs.d/.skk/SKK-JISYO.L")
  ;; (setq skk-extra-jisyo-file-list
  ;; 	(list '("~/.emacs.d/share/skk/SKK-JISYO.geo"
  ;; 		"~/.emacs.d/share/skk/SKK-JISYO.jinmei"
  ;; 		"~/.emacs.d/share/skk/SKK-JISYO.propernoun"
  ;; 		"~/.emacs.d/share/skk/SKK-JISYO.station"))
  ;; 	)

  ;; 日本語用のキーマップの割り当て、cをkにする
  (defun skk-add-key-map (input next output)
    (add-to-list 'skk-rom-kana-rule-list
		 (list input next output)))
  (skk-add-key-map "ca" nil '("カ" . "か"))
  (skk-add-key-map "ci" nil '("キ" . "き"))
  (skk-add-key-map "cu" nil '("ク" . "く"))
  (skk-add-key-map "ce" nil '("ケ" . "け"))
  (skk-add-key-map "co" nil '("コ" . "こ"))
  (skk-add-key-map "cya" nil '("キャ" . "きゃ"))
  (skk-add-key-map "cyi" nil '("キィ" . "きぃ"))
  (skk-add-key-map "cyu" nil '("キュ" . "きゅ"))
  (skk-add-key-map "cye" nil '("キェ" . "きぇ"))
  (skk-add-key-map "cyo" nil '("キョ" . "きょ"))

  (setq skk-dcomp-activate t) ; 動的補完
  (setq skk-dcomp-multiple-activate t) ; 動的補完の複数候補表示
  (setq skk-dcomp-multiple-rows 10) ; 動的補完の候補表示件数
  (setq skk-auto-insert-paren nil)   ; 閉じカッコを自動的に
  (require 'skk-hint); ヒント
  (setq skk-japanese-message-and-error t) ; エラーを日本語に
  (setq skk-show-japanese-menu t); メニューを日本語に
  (setq skk-henkan-strict-okuri-precedence t)
  (setq skk-show-annotation t)

  ;; 候補表示
  ;; (setq skk-show-inline t)  ; 変換候補の表示位置
  ;; (setq skk-show-tooltip t)  ; 変換候補の表示位置
  (setq skk-show-candidates-always-pop-to-buffer t) ; 変換候補の表示位置
  (setq skk-henkan-show-candidates-rows 2) ; 候補表示件数を2列に

  ;; スラッシュを入力可能に 
  (setq skk-kcode-method 'this-key)

  ;; 動的候補表示
  (setq skk-dcomp-activate t) ; 動的補完
  (setq skk-dcomp-multiple-activate t) ; 動的補完の複数候補表示
  (setq skk-dcomp-multiple-rows 10) ; 動的補完の候補表示件数
  ;; 動的補完の複数表示群のフェイス
  (set-face-foreground 'skk-dcomp-multiple-face "Black")
  (set-face-background 'skk-dcomp-multiple-face "LightGoldenrodYellow")
  (set-face-bold 'skk-dcomp-multiple-face nil)
  ;; 動的補完の複数表示郡の補完部分のフェイス
  (set-face-foreground 'skk-dcomp-multiple-trailing-face "dim gray")
  (set-face-bold 'skk-dcomp-multiple-trailing-face nil)
  ;; 動的補完の複数表示郡の選択対象のフェイス
  (set-face-foreground 'skk-dcomp-multiple-selected-face "White")
  (set-face-background 'skk-dcomp-multiple-selected-face "LightGoldenrod4")
  (set-face-bold 'skk-dcomp-multiple-selected-face nil)
  ;; minibufferで英字入力
  (add-hook 'minibuffer-setup-hook
	    '(lambda()
	       (progn
		 (eval-expression (skk-mode) nil)
		 (skk-latin-mode (point))
		 ;; ミニバッファ上に「nil」と表示させないために, 空文字をミニバッファに表示
		 (minibuffer-message ""))))
  (add-hook 'lisp-interaction-mode-hook
	  '(lambda()
	     (eval-expression (skk-mode) nil))))

(use-package ac-skk
  :defer t)

;; clip board, paste
(setq select-enable-clipboard t)

;; ansi-color
(use-package ansi-color
  :defer t
  :commands (ansi-color-for-comint-mode-on))
					; (autoload 'ansi-color-for-comint-mode-on)
;;; 02-input.el ends here
