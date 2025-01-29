;; -----------------
;; - elisp/keys.el -
;; -----------------

;; setting up evil keybindings
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t) ; do \ C-u for universal-argument
  :config
  (evil-mode 1)
  (evil-set-initial-state 'eshell-mode 'emacs)
  (evil-set-initial-state 'shell-mode 'emacs))

;; adding C-r redo support
(use-package undo-tree
  :ensure t
  :after evil
  :diminish
  :config
  (evil-set-undo-system 'undo-redo))
  ;;(global-undo-tree-mode 1))

;; adding evil-mode compatability to numerous packages
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

;; supporting shift + arrow keys to select other frames
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
