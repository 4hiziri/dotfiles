(setq treesit-language-source-alist
      `((json "https://github.com/tree-sitter/tree-sitter-json")
        (tsx "https://github.com/tree-sitter/tree-sitter-typescript"
             "master"
             "tsx"
             ,(lambda ()
                (let ((default-directory (expand-file-name "../" default-directory)))
                  (message "%s" default-directory)
                  (message "%s" (shell-command-to-string "pwd; ls"))
                  (message (shell-command-to-string "npm install")))))
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript"
                    "master"
                    "typescript"
                    ,(lambda ()
                       (let ((default-directory (expand-file-name "../" default-directory)))
                         (message (shell-command-to-string "npm install")))))
        (go "https://github.com/tree-sitter/tree-sitter-go")
        (gomod "https://github.com/camdencheek/tree-sitter-go-mod")
        (python "https://github.com/tree-sitter/tree-sitter-python")
        (markdown "https://github.com/tree-sitter-grammars/tree-sitter-markdown" "split_parser" "tree-sitter-markdown/")
        (markdown-inline "https://github.com/tree-sitter-grammars/tree-sitter-markdown" "split_parser" "tree-sitter-markdown-inline/")
        (dockerfile "https://github.com/camdencheek/tree-sitter-dockerfile")))

;; this repository is awesome, https://github.com/casouri/tree-sitter-module
;; maybe, i should run this script at first time

;; :TODO docker-file-ts-modeも追加

;; https://qiita.com/Hirata-Kodai/items/27745ee506fbb1509252
;; 場合によってはこの方法が良さそう

(defun my-treesit-install-language-grammar (lang-elem)
  (if (and (executable-find "git") (executable-find "tree-sitter"))
      (let* ((default-directory (make-temp-file "my-treesit_workdir" t))
             (lang (nth 0 lang-elem))
             (url (nth 1 lang-elem))
             (branch (nth 2 lang-elem))
             (src-dir (nth 3 lang-elem))
             (pre-command (nth 4 lang-elem))
             (git-command (concat "git clone --depth 1 --single-branch " url " repo")))
        (message (format "create %s tree-sitter librar" (car lang-elem)))
        (when branch
          (setq git-command (concat git-command " -b " branch)))
        (message (shell-command-to-string git-command))
        (setq default-directory (expand-file-name  "repo" default-directory))
        (when src-dir
          (setq default-directory (expand-file-name src-dir default-directory)))
        (when pre-command
          (funcall pre-command))
        (message (shell-command-to-string "tree-sitter generate --abi=14"))
        (message
         (shell-command-to-string
          (format
           "tree-sitter build -o libtree-sitter-%s.so"
           lang)))
        (message
         (shell-command-to-string
          (format "cp libtree-sitter-%s.so ~/.emacs.d/tree-sitter/" lang)))
        (message
         (shell-command-to-string
          (format
           "ln -s ~/.emacs.d/tree-sitter/libtree-sitter-%s.so ~/.emacs.d/tree-sitter/%s.so"
           lang
           lang))))))
;; check need npm install

;; (dolist (element treesit-language-source-alist)
;;   (let* ((lang (car element)))
;;     (if (treesit-language-available-p lang)
;;         (message "treesit: %s is already installed" lang)
;;       (message "treesit: %s is not installed" lang)
;;       (my-treesit-install-language-grammar lang))))

(dolist (element treesit-language-source-alist)
  (if (treesit-language-available-p (car element))
      (message "treesit: %s is already installed" (car element))
    (progn
      (message "treesit: %s is not installed" (car element))
      (my-treesit-install-language-grammar element))))

(use-package treesit
  :ensure nil
  :custom (treesit-font-lock-level 4))

;; 古いモードの方が多機能なときのためにハイライトだけ有効化する
(use-package tree-sitter
  :config
  (add-to-list 'tree-sitter-load-path "~/.emacs.d/tree-sitter/"))
(use-package tree-sitter-langs
  :after tree-sitter
  :config
  (tree-sitter-hl-add-alist 'markdown-mode 'markdown))
;; (use-package tree-sitter-hl
;;   :after tree-sitter
;;   :config
;;   (tree-sitter-hl-add-alist 'markdown-mode 'markdown))
