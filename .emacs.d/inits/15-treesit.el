(setq treesit-language-source-alist
      `((ada "https://github.com/briot/tree-sitter-ada" "master" "."
             ,(lambda ()
                (message (shell-command-to-string "npm install"))))
        (autohotkey "https://github.com/holy-tao/tree-sitter-autohotkey")
        (astro "https://github.com/virchau13/tree-sitter-astro" "master" "."
                ,(lambda ()
                   (message (shell-command-to-string "npm install"))))
        (agda "https://github.com/tree-sitter/tree-sitter-agda")
        (bison "https://gitlab.com/btuin2/tree-sitter-bison")
        (bash "https://github.com/tree-sitter/tree-sitter-bash")
        (c "https://github.com/tree-sitter/tree-sitter-c")
        (c3 "https://github.com/c3lang/tree-sitter-c3")
        (c-sharp "https://github.com/tree-sitter/tree-sitter-c-sharp")
        (cmake "https://github.com/uyha/tree-sitter-cmake")
        (cpp "https://github.com/tree-sitter/tree-sitter-cpp" "master" "."
             ,(lambda ()
                (message (shell-command-to-string "npm install"))))
        (css "https://github.com/tree-sitter/tree-sitter-css")
        (clojure "https://github.com/sogaiu/tree-sitter-clojure")
        (cylc "https://github.com/elliotfontaine/tree-sitter-cylc")
        (dart "https://github.com/UserNobody14/tree-sitter-dart")
        (doxygen "https://github.com/tree-sitter-grammars/tree-sitter-doxygen")
        (elisp "https://github.com/Wilfred/tree-sitter-elisp")
        (elixir "https://github.com/elixir-lang/tree-sitter-elixir")
        (erlang "https://github.com/whatsapp/tree-sitter-erlang")
        (glsl "https://github.com/tree-sitter-grammars/tree-sitter-glsl" "master" "."
              ,(lambda ()
                 (message (shell-command-to-string "npm install"))))
        (gpr "https://github.com/brownts/tree-sitter-gpr")
        (haskell "https://github.com/tree-sitter/tree-sitter-haskell")
        (heex "https://github.com/phoenixframework/tree-sitter-heex")
        (html "https://github.com/tree-sitter/tree-sitter-html")
        (janet-simple "https://github.com/sogaiu/tree-sitter-janet-simple")
        (java "https://github.com/tree-sitter/tree-sitter-java")
        (javascript "https://github.com/tree-sitter/tree-sitter-javascript")
        (jsdoc "https://github.com/tree-sitter/tree-sitter-jsdoc")
        (json "https://github.com/tree-sitter/tree-sitter-json")
        (julia "https://github.com/tree-sitter/tree-sitter-julia")
        (kotlin "https://github.com/fwcd/tree-sitter-kotlin")
        (lua "https://github.com/tree-sitter-grammars/tree-sitter-lua")
        (magik "https://github.com/krn-robin/tree-sitter-magik")
        (make "https://github.com/tree-sitter-grammars/tree-sitter-make")
        (nix "https://github.com/nix-community/tree-sitter-nix")
        ;; (org "https://github.com/nvim-orgmode/tree-sitter-org") ; error
        (ocaml "https://github.com/tree-sitter/tree-sitter-ocaml" "master" "grammars/ocaml")
        (fluent "https://github.com/tree-sitter/tree-sitter-fluent")
        (tsq "https://github.com/tree-sitter/tree-sitter-tsq")
        (ql-dbscheme "https://github.com/tree-sitter/tree-sitter-ql-dbscheme")
        (swift "https://github.com/tree-sitter/tree-sitter-swift")
        (meson "https://github.com/tree-sitter-grammars/tree-sitter-meson")
        (perl "https://github.com/tree-sitter-perl/tree-sitter-perl")
        (php "https://github.com/tree-sitter/tree-sitter-php" "master" "php")
        (proto "https://github.com/mitchellh/tree-sitter-proto")
        (ql "https://github.com/tree-sitter/tree-sitter-ql")
        (ruby "https://github.com/tree-sitter/tree-sitter-ruby")
        (rust "https://github.com/tree-sitter/tree-sitter-rust")
        (regex "https://github.com/tree-sitter/tree-sitter-regex")
        (embedded-template "https://github.com/tree-sitter/tree-sitter-embedded-template")
        (scala "https://github.com/tree-sitter/tree-sitter-scala")
        (scss "https://github.com/tree-sitter-grammars/tree-sitter-scss" "master" "."
              ,(lambda ()
                 (message (shell-command-to-string "npm install"))))
        (sdml "https://github.com/sdm-lang/tree-sitter-sdml")
        (souffle "https://github.com/langston-barrett/tree-sitter-souffle")
        (sql "https://github.com/DerekStride/tree-sitter-sql")
        (surface "https://github.com/connorlay/tree-sitter-surface")
        (svelte "https://github.com/Himujjal/tree-sitter-svelte")
        (toml "https://github.com/tree-sitter-grammars/tree-sitter-toml")
        (typst "https://github.com/uben0/tree-sitter-typst")
        (vala "https://github.com/vala-lang/tree-sitter-vala")
        (verilog "https://github.com/tree-sitter/tree-sitter-verilog")
        (vim "https://github.com/tree-sitter-grammars/tree-sitter-vim")
        (query "https://github.com/tree-sitter-grammars/tree-sitter-query")
        (vue "https://github.com/tree-sitter-grammars/tree-sitter-vue" "main" "."
             ,(lambda ()
                (message (shell-command-to-string "npm install"))))
        (xml "https://github.com/tree-sitter-grammars/tree-sitter-xml" "master" "xml")
        (dtd "https://github.com/tree-sitter-grammars/tree-sitter-xml" "master" "dtd")
        (hcl "https://github.com/tree-sitter-grammars/tree-sitter-hcl")
        (gpg "https://github.com/tree-sitter-grammars/tree-sitter-gpg-config")
        (chatito "https://github.com/tree-sitter-grammars/tree-sitter-chatito")
        (arduino "https://github.com/tree-sitter-grammars/tree-sitter-arduino" "master" "."
                 ,(lambda ()
                (message (shell-command-to-string "npm install"))))
        (pem "https://github.com/tree-sitter-grammars/tree-sitter-pem")
        (gitattributes "https://github.com/tree-sitter-grammars/tree-sitter-gitattributes")
        (poe-filter "https://github.com/tree-sitter-grammars/tree-sitter-poe-filter")
        (cst "https://github.com/tree-sitter-grammars/tree-sitter-cst")
        (readline "https://github.com/tree-sitter-grammars/tree-sitter-readline")
        (wgsl-bevy "https://github.com/tree-sitter-grammars/tree-sitter-wgsl-bevy" "master" "."
                   ,(lambda ()
                      (message (shell-command-to-string "npm install"))))
        (cuda "https://github.com/tree-sitter-grammars/tree-sitter-cuda"  "master" "."
              ,(lambda ()
                 (message (shell-command-to-string "npm install"))))
        (csv "https://github.com/tree-sitter-grammars/tree-sitter-csv" "master" "csv")
        (psv "https://github.com/tree-sitter-grammars/tree-sitter-csv" "master" "psv")
        (tsv "https://github.com/tree-sitter-grammars/tree-sitter-csv" "master" "tsv")
        (hyprlang "https://github.com/tree-sitter-grammars/tree-sitter-hyprlang")
        (diff "https://github.com/tree-sitter-grammars/tree-sitter-diff")
        (hare "https://github.com/tree-sitter-grammars/tree-sitter-hare")
        (slang "https://github.com/tree-sitter-grammars/tree-sitter-slang" "master" "."
              ,(lambda ()
                 (message (shell-command-to-string "npm install"))))
        (ssh-config "https://github.com/tree-sitter-grammars/tree-sitter-ssh-config")
        (test "https://github.com/tree-sitter-grammars/tree-sitter-test")
        (pymanifest "https://github.com/tree-sitter-grammars/tree-sitter-pymanifest")
        (udev "https://github.com/tree-sitter-grammars/tree-sitter-udev")
        (xcompose "https://github.com/tree-sitter-grammars/tree-sitter-xcompose")
        (printf "https://github.com/tree-sitter-grammars/tree-sitter-printf")
        (properties "https://github.com/tree-sitter-grammars/tree-sitter-properties")
        (gosum "https://github.com/tree-sitter-grammars/tree-sitter-go-sum")
        (requirements "https://github.com/tree-sitter-grammars/tree-sitter-requirements")
        (bicep "https://github.com/tree-sitter-grammars/tree-sitter-bicep")
        (hlsl "https://github.com/tree-sitter-grammars/tree-sitter-hlsl" "master" "."
              ,(lambda ()
                 (message (shell-command-to-string "npm install"))))
        (bitbake "https://github.com/tree-sitter-grammars/tree-sitter-bitbake")
        (kdl "https://github.com/tree-sitter-grammars/tree-sitter-kdl")
        (tcl "https://github.com/tree-sitter-grammars/tree-sitter-tcl")
        (luadoc "https://github.com/tree-sitter-grammars/tree-sitter-luadoc")
        (starlark "https://github.com/tree-sitter-grammars/tree-sitter-starlark" "master" "."
              ,(lambda ()
                 (message (shell-command-to-string "npm install"))))
        (objc "https://github.com/tree-sitter-grammars/tree-sitter-objc" "master" "."
              ,(lambda ()
                 (message (shell-command-to-string "npm install"))))
        (odin "https://github.com/tree-sitter-grammars/tree-sitter-odin")
        (commonlisp "https://github.com/tree-sitter-grammars/tree-sitter-commonlisp"
                    "master"
                    "."
                    ,(lambda ()
                       (message (shell-command-to-string "npm install"))))
        (ungrammar "https://github.com/tree-sitter-grammars/tree-sitter-ungrammar")
        (luau "https://github.com/tree-sitter-grammars/tree-sitter-luau"  "master" "."
              ,(lambda ()
                 (message (shell-command-to-string "npm install"))))
        (kconfig "https://github.com/tree-sitter-grammars/tree-sitter-kconfig")
        (puppet "https://github.com/tree-sitter-grammars/tree-sitter-puppet")
        (re2c "https://github.com/tree-sitter-grammars/tree-sitter-re2c")
        (squirrel "https://github.com/tree-sitter-grammars/tree-sitter-squirrel")
        (luap "https://github.com/tree-sitter-grammars/tree-sitter-luap")
        (uxntal "https://github.com/tree-sitter-grammars/tree-sitter-uxntal")
        (tablegen "https://github.com/tree-sitter-grammars/tree-sitter-tablegen")
        (ron "https://github.com/tree-sitter-grammars/tree-sitter-ron")
        (smali "https://github.com/tree-sitter-grammars/tree-sitter-smali")
        (yuck "https://github.com/tree-sitter-grammars/tree-sitter-yuck")
        (func "https://github.com/tree-sitter-grammars/tree-sitter-func")
        (cairo "https://github.com/tree-sitter-grammars/tree-sitter-cairo")
        (pony "https://github.com/tree-sitter-grammars/tree-sitter-pony")
        (thrift "https://github.com/tree-sitter-grammars/tree-sitter-thrift")
        (po "https://github.com/tree-sitter-grammars/tree-sitter-po")
        (cpon "https://github.com/tree-sitter-grammars/tree-sitter-cpon")
        (firrtl "https://github.com/tree-sitter-grammars/tree-sitter-firrtl")
        (capnp "https://github.com/tree-sitter-grammars/tree-sitter-capnp")
        (gstlaunch "https://github.com/tree-sitter-grammars/tree-sitter-gstlaunch")
        (linkerscript "https://github.com/tree-sitter-grammars/tree-sitter-linkerscript")
        (gn "https://github.com/tree-sitter-grammars/tree-sitter-gn")
        (nqc "https://github.com/tree-sitter-grammars/tree-sitter-nqc" "master" "."
              ,(lambda ()
                 (message (shell-command-to-string "npm install"))))
        (systemverilog "https://github.com/gmlarumbe/tree-sitter-systemverilog")
        (vhdl "https://github.com/alemuller/tree-sitter-vhdl")
        (wgsl "https://github.com/gpuweb/tree-sitter-wgsl")
        (yaml "https://github.com/tree-sitter-grammars/tree-sitter-yaml")
        (zig "https://github.com/tree-sitter-grammars/tree-sitter-zig")
        (zsh "https://github.com/tree-sitter-grammars/tree-sitter-zsh" "master" "."
              ,(lambda ()
                 (message (shell-command-to-string "npm install"))))
        (ispc "https://github.com/tree-sitter-grammars/tree-sitter-ispc" "master" "."
              ,(lambda ()
                 (message (shell-command-to-string "npm install"))))
        ;; (move "https://github.com/tree-sitter-grammars/tree-sitter-move") ; error
        (qmldir "https://github.com/tree-sitter-grammars/tree-sitter-qmldir")
        (tsx "https://github.com/tree-sitter/tree-sitter-typescript"
             "master"
             "tsx"
             ,(lambda ()
                (let ((default-directory (expand-file-name "../" default-directory)))
                  (message (shell-command-to-string "npm install")))))
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript"
                    "master"
                    "typescript"
                    ,(lambda ()
                       (let ((default-directory (expand-file-name "../" default-directory)))
                         (message (shell-command-to-string "npm install")))))
        (go "https://github.com/tree-sitter/tree-sitter-go")
        (gomod "https://github.com/camdencheek/tree-sitter-go-mod")
        (gowork "https://github.com/omertuc/tree-sitter-go-work")
        (python "https://github.com/tree-sitter/tree-sitter-python")
        (markdown "https://github.com/tree-sitter-grammars/tree-sitter-markdown" "split_parser" "tree-sitter-markdown/")
        (markdown-inline "https://github.com/tree-sitter-grammars/tree-sitter-markdown" "split_parser" "tree-sitter-markdown-inline/")
        (dockerfile "https://github.com/4hiziri/tree-sitter-dockerfile-fix")))

(defun my-treesit-install-language-grammar (lang-elem)
  (if (and (executable-find "git") (executable-find "tree-sitter") (executable-find "npm"))
      (let* ((default-directory (make-temp-file "my-treesit_workdir" t))
             (lang (nth 0 lang-elem))
             (url (nth 1 lang-elem))
             (branch (nth 2 lang-elem))
             (src-dir (nth 3 lang-elem))
             (pre-command (nth 4 lang-elem))
             (git-command (concat "git clone --depth 1 --single-branch " url " repo")))
        (message (format "create %s tree-sitter library" (car lang-elem)))
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
          (format "cp libtree-sitter-%s.so ~/.emacs.d/tree-sitter/" lang))))
    (message "Need git, tree-sitter, npx and stable npm")))
;; check need npm install

(use-package async
  :demand t)

(defun my-treesit-install-all-parallel ()
  (interactive)
  (dolist (lang-elem treesit-language-source-alist)
    (let ((lang (car lang-elem)))
      (if (treesit-language-available-p lang)
          (message "treesit: %s is installed" lang)
        (message "treesit: build libtree-sitter-%s.so" lang)
        (async-start
         `(lambda ()
            (let ((my-install-func (lambda (lang-elem)
                                     ,(symbol-function 'my-treesit-install-language-grammar))))
              (funcall my-install-func ',lang-elem)))
         `(lambda (result)
            (message "treesit: %s is installed" ',lang)))))))
(my-treesit-install-all-parallel)
;; :TODO node v20じゃないと駄目なのでチェック入れる、nvm.elでやるのが楽だけどnpmインストール馬鹿遅い

(defun install-ts-lib (lang)
  (let ((tlap (treesit-language-available-p (car lang) t)))
    (if (car tlap)
        (message "treesit: %s is already installed" (car lang))
      (progn
        (message "treesit: %s is not installed: %s" (car lang) (cdr tlap))
        (my-treesit-install-language-grammar lang)))))

(install-ts-lib (assoc 'dockerfile treesit-language-source-alist))


(defun my-install-ts-lib (p lang)
  (interactive "P\nslib:")
  (install-ts-lib (assoc (make-symbol lang) treesit-language-source-alist)))

;; (dolist (lang treesit-language-source-alist)
;;   (install-ts-lib lang))

(use-package treesit
  :ensure nil
  :custom (treesit-font-lock-level 4))
