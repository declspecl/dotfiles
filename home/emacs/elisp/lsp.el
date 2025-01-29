;; ----------------
;; - elisp/lsp.el -
;; ----------------

;; enabling lsp-mode
(use-package lsp-mode
  :ensure t
  :init
  ; sideline
  (setq lsp-ui-sideline-show-diagnostics t)
  (setq lsp-ui-sideline-show-hover t)
  (setq lsp-ui-sideline-show-code-actions t)
  (setq lsp-ui-sideline-delay 0.1)
  ; docs
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-doc-position 'at-point)
  (setq lsp-ui-doc-show-with-cursor t)
  (setq lsp-ui-doc-delay 1.0)
  ; inlay hints
  (setq lsp-inlay-hint-enable t)
  ;; :init
  ;; (setq lsp-keymap-prefix "C-c l")
  ;;:config
  ;;(lsp-enable-which-key-integration t)
  :hook (lsp-mode . lsp-enable-which-key-integration)
  :commands (lsp lsp-deferred)
  :config
  (lsp-inlay-hints-mode 1))

;; lsp-mode extension for sideline + diagnostic info
(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode))
  ; :custom
  ; (lsp-ui-sideline-show-hover t))

;; enable automatic completion UI
(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind
  (:map company-active-map
        ("C-<tab>" . company-complete-selection))
  ; (:map lsp-mode-map
        ; ("<tab>" . company-indent-or-complete-common))
        ; ("<tab>" . indent-for-tab-command))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

;; prettify company mode completion UI
(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))
