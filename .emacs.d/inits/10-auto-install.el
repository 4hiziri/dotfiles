;;; 10-auto-install -- auto-install config
;;; Commentary:
;; disabled now
;;; Code:
(use-package auto-install
  :disabled t ; use single package manager, straight.
  :defer t
  :commands (auto-install-from-url auto-install-from-gist auto-install-from-emacswiki)
  :config
  ;; インストールディレクトリを設定する 初期値は ~/.emacs.d/auto-install/
  (setq auto-install-directory "~/.emacs.d/elisp/")
  ;; EmacsWikiに登録されているelisp の名前を取得する
  (setq auto-install-use-wget t)
  (auto-install-update-emacswiki-package-name t)
  ;; 必要であればプロキシの設定を行う
  ;;(setq url-proxy-services '(("http" . "localhost:8339")))
  ;; install-elisp の関数を利用可能にする
  (auto-install-compatibility-setup))

;;; 10-auto-install.el ends here
