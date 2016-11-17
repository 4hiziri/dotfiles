;; point-undoの設定
(use-package point-undo
  :defer t
  :bind (("M-[" . point-undo)
	 ("M-]" . point-redo)))
