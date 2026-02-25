(setq treesit-language-source-alist
      '((json "https://github.com/tree-sitter/tree-sitter-json")
        (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
        (go "https://github.com/tree-sitter/tree-sitter-go")
        (gomod "https://github.com/camdencheek/tree-sitter-go-mod")
        (python "https://github.com/tree-sitter/tree-sitter-python")
        (markdown "https://github.com/tree-sitter-grammars/tree-sitter-markdown" "v0.5.1" "tree-sitter-markdown/src")
        (markdown-inline "https://github.com/tree-sitter-grammars/tree-sitter-markdown" "v0.5.1" "tree-sitter-markdown-inline/src")))

;; (setq treesit-language-source-alist
;;       '((bash "https://github.com/tree-sitter/tree-sitter-bash" "v0.23.3" nil nil nil)
;;         (go "https://github.com/tree-sitter/tree-sitter-go" "v0.23.4" nil nil nil)
;;         (gomod "https://github.com/camdencheek/tree-sitter-go-mod" "v1.0.2" nil nil nil)
;;         (python "https://github.com/tree-sitter/tree-sitter-python" "v0.23.6" nil nil nil)
;;         (markdown "https://github.com/tree-sitter-grammars/tree-sitter-markdown" "v0.5.1" "tree-sitter-markdown/src" nil nil)
;;         (markdown-inline "https://github.com/tree-sitter-grammars/tree-sitter-markdown" "v0.5.1" "tree-sitter-markdown-inline/src" nil nil)))

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
             (git-command (concat "git clone --depth 1 --single-branch " url " repo")))
        (message (format "create %s tree-sitter librar" (car lang-elem)))
        (when branch
          (setq git-command (concat git-command " -b " branch)))
        (message (shell-command-to-string git-command))
        (setq default-directory (expand-file-name  "repo" default-directory))
        (when src-dir
          (setq default-directory (expand-file-name src-dir default-directory)))
        (message (shell-command-to-string "tree-sitter generate --abi=14"))
        (message
         (shell-command-to-string
          (format
           "gcc -shared -o libtree-sitter-%s.so -fPIC src/parser.c src/scanner.c -I./src"
           lang)))
        (message
         (shell-command-to-string
          (format "cp libtree-sitter-%s.so ~/.emacs.d/tree-sitter/" lang))))))


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
