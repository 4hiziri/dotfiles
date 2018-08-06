;; ;; helm-cider

;; ;;cider
;; (use-package cider
;;   :defer t
;;   :init
;;   (add-hook 'cider-mode-hook #'clj-refactor-mode)
;;   (add-hook 'cider-mode-hook #'company-mode)
;;   (add-hook 'cider-mode-hook #'eldoc-mode)
;;   (add-hook 'cider-repl-mode-hook #'company-mode)
;;   (add-hook 'cider-repl-mode-hook #'eldoc-mode)
;;   :config
;;   (setq nrepl-log-messages t
;;         cider-repl-display-in-current-window t
;;         cider-repl-use-clojure-font-lock t
;;         cider-prompt-save-file-on-load 'always-save
;;         cider-font-lock-dynamically '(macro core function var)
;;         cider-overlays-use-font-lock t)
;;   (cider-repl-toggle-pretty-printing))

;; ;;clojure
;; (use-package clojure-mode
;;   :defer t
;;   :init
;;   ;;(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))
;;   (add-hook 'clojure-mode-hook 'cider-mode)
;;   (add-hook 'clojure-mode-hook 'paredit-mode))

;; (use-package ac-cider
;;   :defer t
;;   :init
;;   (add-hook 'cider-mode-hook 'ac-flyspell-workaround)
;;   (add-hook 'cider-mode-hook 'ac-cider-setup)
;;   (add-hook 'cider-repl-mode-hook 'ac-cider-setup)
;;   :config
;;   (add-to-list 'ac-modes 'cider-repl-mode))
