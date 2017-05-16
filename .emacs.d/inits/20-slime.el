;; slime
(use-package slime
  :defer t
  :init
  (add-hook 'slime-mood-hook 'paredit-mode 'rainbow-delimiters-mode)
  (setq inferior-lisp-program "ros -L sbcl -Q run") ; your Lisp system
  :config
  (slime-setup '(slime-repl slime-fancy slime-banner slime-indentation))
  (setq slime-net-coding-system 'utf-8-unix)

  ;; solve confilct between skk and slime
  ;; for skk
  (defun skk-slime-space-insert (n)
    (interactive "p")
    (if skk-henkan-mode (skk-insert) (slime-space n)))
  (add-hook 'slime-mode-hook
	    (lambda()
	      (define-key slime-mode-map " " 'skk-slime-space-insert)))
  (add-hook 'slime-repl-mode-hook
	    (lambda()
	      (define-key slime-repl-mode-map " " 'skk-slime-space-insert)))
  (slime-autodoc-mode))

;; popwin
(use-package popwin
  :defer t
  :config
  ;; Apropos
  (push '("*slime-apropos*") popwin:special-display-config)
  ;; Macroexpand
  (push '("*slime-macroexpansion*") popwin:special-display-config)
  ;; Help
  (push '("*slime-description*") popwin:special-display-config)
  ;; Compilation
  (push '("*slime-compilation*" :noselect t) popwin:special-display-config)
  ;; Cross-reference
  (push '("*slime-xref*") popwin:special-display-config)
  ;; Debugger
  (push '(sldb-mode :stick t) popwin:special-display-config)
  ;; REPL
  (push '(slime-repl-mode) popwin:special-display-config)
  ;; Connections
  (push '(slime-connection-list-mode) popwin:special-display-config))

;; company-slime
(use-package slime-company
  :defer t
  :config
  (slime-setup '(slime-company)))

;; reference
(use-package hyperspec
  :after slime
  :config
  (setq common-lisp-hyperspec-root         (expand-file-name "~/.emacs.d/share/HyperSpec/")
	common-lisp-hyperspec-symbol-table (expand-file-name "~/.emacs.d/share/HyperSpec/Data/Map_Sym.txt"))
  (defun common-lisp-hyperspec (symbol-name)
    (interactive (list (common-lisp-hyperspec-read-symbol-name)))
    (let ((name (common-lisp-hyperspec--strip-cl-package
		 (downcase symbol-name))))
      (cl-maplist (lambda (entry)
		    (eww-open-file (concat common-lisp-hyperspec-root "Body/"
					   (car entry)))
		    (when (cdr entry)
		      (sleep-for 1.5)))
		  (or (common-lisp-hyperspec--find name)
		      (error "The symbol `%s' is not defined in Common Lisp"
			     symbol-name)))))
  (defun common-lisp-hyperspec-lookup-reader-macro (macro)
    (interactive
     (list
      (let ((completion-ignore-case t))
	(completing-read "Look up reader-macro: "
			 common-lisp-hyperspec--reader-macros nil t
			 (common-lisp-hyperspec-reader-macro-at-point)))))
    (eww-open-file
     (concat common-lisp-hyperspec-root "Body/"
	     (gethash macro common-lisp-hyperspec--reader-macros))))
  (defun common-lisp-hyperspec-format (character-name)
    (interactive (list (common-lisp-hyperspec--read-format-character)))
    (cl-maplist (lambda (entry)
		  (eww-open-file (common-lisp-hyperspec-section (car entry))))
		(or (gethash character-name
			     common-lisp-hyperspec--format-characters)
		    (error "The symbol `%s' is not defined in Common Lisp"
			   character-name))))
  (defadvice common-lisp-hyperspec (around common-lisp-hyperspec-around activate)
    (let ((buf (current-buffer)))
      ad-do-it
      (switch-to-buffer buf)
      (pop-to-buffer "*eww*")))
  (defadvice common-lisp-hyperspec-lookup-reader-macro (around common-lisp-hyperspec-lookup-reader-macro-around activate)
    (let ((buf (current-buffer)))
      ad-do-it
      (switch-to-buffer buf)
      (pop-to-buffer "*eww*")))
  (defadvice common-lisp-hyperspec-format (around common-lisp-hyperspec-format activate)
    (let ((buf (current-buffer)))
      ad-do-it
      (switch-to-buffer buf)
      (pop-to-buffer "*eww*"))))
