;; memo pip install flake8 importmagic yapf autopep8 ipdb ipython
;; check hacking?

(use-package python
  :defer t
  :mode ("\\.py\\'" . python-mode))

(use-package smartrep)

(use-package elpy
  :after python
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  ;; (add-hook 'python-mode-hook (hs-minor-mode))
  (add-hook 'python-mode-hook 'turn-on-smartparens-mode)
  (add-hook 'inferior-python-mode-hook 'turn-on-smartparens-mode)
  (remove-hook 'elpy-modules 'elpy-module-flymake)
  (add-hook 'elpy-mode-hook 'flycheck-mode)
  (package-initialize)
  :config
  (elpy-enable)
  ;; 自動補完
  (setq elpy-rpc-backend "jedi")
  (setq epc:accept-process-timeout 200)
  (setq jedi:complete-on-dot t)
  (setq python-indent-offset 4)
  (define-key python-mode-map "\C-ct" 'jedi:goto-definition)
  (define-key python-mode-map "\C-cb" 'jedi:goto-definition-pop-marker)
  (define-key python-mode-map "\C-cr" 'helm-jedi-related-names)
  
  ;; python-shell
  (setq python-shell-interpreter "ipython")
  (setq python-shell-interpreter-args "--simple")
  (setq python-shell-completion-native-enable nil)
  
  (smartrep-define-key elpy-mode-map "C-c"
    '(("C-n" . flycheck-next-error)
      ("C-p" . flycheck-previous-error))))

;; jedi
(use-package jedi-core
  :defer t
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
   ;; backendに追加
  (add-to-list 'company-backends 'company-jedi)
  :config
  (setq jedi:complete-on-dot t)
  (setq jedi:use-shortcuts t))

;; yapf
(use-package py-yapf
  :defer t)
