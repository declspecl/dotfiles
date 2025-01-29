(setq treesit-language-source-alist
   '((bash "https://github.com/tree-sitter/tree-sitter-bash")
     (cmake "https://github.com/uyha/tree-sitter-cmake")
     (c "https://github.com/tree-sitter/tree-sitter-c")
     (css "https://github.com/tree-sitter/tree-sitter-css")
     (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
     (go "https://github.com/tree-sitter/tree-sitter-go")
     (html "https://github.com/tree-sitter/tree-sitter-html")
     (java "https://github.com/tree-sitter/tree-sitter-java")
     (javascript "https://github.com/tree-sitter/tree-sitter-javascript")
     (json "https://github.com/tree-sitter/tree-sitter-json")
     (make "https://github.com/alemuller/tree-sitter-make")
     (markdown "https://github.com/ikatyang/tree-sitter-markdown")
     (python "https://github.com/tree-sitter/tree-sitter-python")
     (rust "https://github.com/tree-sitter/tree-sitter-rust")
     (toml "https://github.com/tree-sitter/tree-sitter-toml")
     (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
     (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
     (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

;; define languages i want to have the tree-sitter grammars for 
(setq treesit-langs (list
                     ;; web languages
                     'typescript 'tsx 'javascript 'html 'css 'json
                     ;; others
                     'rust 'cpp 'c 'python 'java 'go
                     ;; config and misc files
                     'toml 'yaml 'markdown))

;; automatically install all the tree-sitter grammars for those languages if they are not already installed
(dolist (lang treesit-langs)
  (unless (treesit-language-available-p lang)
    (treesit-install-language-grammar lang)))

;; set max syntax highlight level
(setq treesit-font-lock-level 4)

;; web languages
(add-to-list 'auto-mode-alist '("/.tsx/'" . tsx-ts-mode))
(add-to-list 'auto-mode-alist '("/.ts/'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("/.js/'" . javascript-ts-mode))
(add-to-list 'auto-mode-alist '("/.html?/'" . html-ts-mode))
(add-to-list 'auto-mode-alist '("/.css/'" . css-ts-mode))
(add-to-list 'auto-mode-alist '("/.json/'" . json-ts-mode))

(add-hook 'tsx-ts-mode-hook 'lsp-deferred)
(add-hook 'typescript-ts-mode-hook 'lsp-deferred)
(add-hook 'javascript-ts-mode-hook 'lsp-deferred)
(add-hook 'html-ts-mode-hook 'lsp-deferred)
(add-hook 'css-ts-mode-hook 'lsp-deferred)
(add-hook 'json-ts-mode-hook 'lsp-deferred)

;; configuration options
(setq typescript-ts-mode-indent-offset 4)
(setq json-ts-mode-indent-offset 4)

;; others
(add-to-list 'auto-mode-alist '("/.rs/'" . rust-ts-mode))
(add-to-list 'auto-mode-alist '("/.cpp/'" . cpp-ts-mode))
(add-to-list 'auto-mode-alist '("/.c/'" . c-ts-mode))
(add-to-list 'auto-mode-alist '("/.py/'" . python-ts-mode))
(add-to-list 'auto-mode-alist '("/.java/'" . java-ts-mode))
(add-to-list 'auto-mode-alist '("/.go/'" . go-ts-mode))

(add-hook 'rust-ts-mode-hook 'lsp-deferred)
(add-hook 'cpp-ts-mode-hook 'lsp-deferred)
(add-hook 'c-ts-mode-hook 'lsp-deferred)
(add-hook 'python-ts-mode-hook 'lsp-deferred)
(add-hook 'java-ts-mode-hook 'lsp-deferred)
(add-hook 'go-ts-mode-hook 'lsp-deferred)

;; configuration options
(setq c-ts-mode-indent-style 'bsd)
(setq go-ts-mode-indent-offset 4)

;; config and misc files
(add-to-list 'auto-mode-alist '("/.toml/'" . toml-ts-mode))
(add-to-list 'auto-mode-alist '("/.yaml/'" . yaml-ts-mode))
(add-to-list 'auto-mode-alist '("/.md/'" . md-ts-mode))

(add-hook 'toml-ts-mode-hook 'lsp-deferred)
(add-hook 'yaml-ts-mode-hook 'lsp-deferred)
(add-hook 'md-ts-mode-hook 'lsp-deferred)

;; snippets
(when (require 'yasnippet nil 'noerror)
  (package-install 'yasnippet))

(when (require 'yasnippet-snippets nil 'noerror)
  (package-install 'yasnippet-snippets))

(yas-global-mode 1)
