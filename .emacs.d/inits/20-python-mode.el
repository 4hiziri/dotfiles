;;; 20-python-mode.el --- python mode config
;;; Commentary:
;;; Code:

(use-package python
  :defer t
  :mode ("\\.py\\'" . python-mode))

(use-package smartrep)

;; need, sudo apt install python3-jedi black python3-autopep8 yapf3 python3-yapf python3-isort
;; https://elpy.readthedocs.io/en/latest/
;; M-x elpy-config
;; C-c C-c: evaluates the current python script (or region if something is selected) in an interactive python shell.
;; C-RET evaluates the current statement
;; C-c C-z switches between your script and the interactive shell.
;; C-c C-d displays doc under cursor. doc pop in a different buffer, can be closed with q.
;;
;; M-x elpy-format-code
(use-package elpy
  :after python
  :defer t
  :init
  (add-hook 'python-mode-hook 'turn-on-smartparens-mode)
  (add-hook 'inferior-python-mode-hook 'turn-on-smartparens-mode)
  ;; (add-hook 'elpy-mode-hook 'flycheck-mode)

  :config
  (elpy-enable)
  (setq python-indent-offset 4)
  ;; python shell
  (setq python-shell-interpreter "ipython3")
  (setq python-shell-interpreter-args "--simple")
  )

(use-package py-isort
  :defer t)

(use-package py-yapf
  :defer t)

;; (use-package elpy
;;   :after python
;;   :init
;;   (add-hook 'python-mode-hook 'jedi:setup)
;;   ;; (add-hook 'python-mode-hook (hs-minor-mode))
;;   (package-initialize)
;;   :config
;;   (elpy-enable)
;;   ;; 自動補完
;;   (setq elpy-rpc-backend "jedi")
;;   (setq epc:accept-process-timeout 200)
;;   (setq jedi:complete-on-dot t)
;;
;;   (define-key python-mode-map "\C-ct" 'jedi:goto-definition)
;;   (define-key python-mode-map "\C-cb" 'jedi:goto-definition-pop-marker)
;;   (define-key python-mode-map "\C-cr" 'helm-jedi-related-names)

;;   ;; python-shell
;;   (setq python-shell-completion-native-enable nil)

;;   (smartrep-define-key elpy-mode-map "C-c"
;;     '(("C-n" . flycheck-next-error)
;;       ("C-p" . flycheck-previous-error)))

;;   ;; activate elpy env
;;   (defvar venv-default "~/.emacs.d/.venv")
;;   (pyvenv-activate venv-default)
;;   (setq elpy-rpc-python-command "python3")
;;   )

;; (use-package company-jedi
;;   :defer t)

;; jedi
;; (use-package jedi-core
;;   :defer t
;;   :init
;;   (add-hook 'python-mode-hook 'jedi:setup)
;;    ;; backendに追加
;;   (add-to-list 'company-backends 'company-jedi)
;;   :config
;;   (setq jedi:complete-on-dot t)
;;   (setq jedi:use-shortcuts t))

;;; 20-python-mode.el ends here
