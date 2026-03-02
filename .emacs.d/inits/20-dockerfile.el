;; npm install -g dockerfile-language-server-nodejs

(use-package dockerfile-ts-mode
  :mode ("Dockerfile\\'" . dockerfile-ts-mode)
  :ensure nil
  :hook ((dockerfile-ts-mode . eglot-ensure)
         (dockerfile-ts-mode . flymake-mode)))
