;; インライン補完

(use-package corfu
  :defer t
  :bind
  (:map corfu-map
        ("C-s" . corfu-insert-separator)
        ("TAB" . corfu-complete)
        ("<tab>" . corfu-complete))
  :custom
  (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  (corfu-auto t)
  (corfu-auto-delay 0.2)
  (corfu-auto-prefix 3)
  (corfu-scroll-margin 2)
  (corfu-quit-no-match 'separator)
  (corfu-quit-at-boundary nil)
  (corfu-quit-no-match t)
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  (corfu-preselect 'prompt)
  (corfu-on-exact-match nil)
  :init
  ;; Capfs and Dabbrev can be used globally (M-/).  See also the customization
  (global-corfu-mode 1)
  ;; Enable optional extension modes:
  ;; (corfu-history-mode)
  (corfu-popupinfo-mode))

(use-package corfu-terminal
  :after corfu
  :config
  (corfu-terminal-mode 1))

(use-package corfu-prescient
  :after orderless
  :custom
  (corfu-prescient-mode 1)
  ;; orderlessをマッチングで使う、prescientはスコアリングのみ
  (corfu-prescient-enable-filtering nil))

(use-package emacs
  :ensure nil
  :custom
  ;; TAB cycle if there are only few candidates
  ;; (completion-cycle-threshold 3)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (tab-always-indent 'complete)

  ;; Emacs 30 and newer: Disable Ispell completion function.
  ;; Try `cape-dict' as an alternative.
  (text-mode-ispell-word-completion nil)

  ;; Hide commands in M-x which do not apply to the current mode.  Corfu
  ;; commands are hidden, since they are not used via M-x. This setting is
  ;; useful beyond Corfu.
  (read-extended-command-predicate #'command-completion-default-include-p))
