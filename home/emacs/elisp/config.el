;; -------------------
;; - elisp/config.el -
;; -------------------

;; optimize gc interval
(setq gc-cons-threshodl (* 50 1000 1000))

;; relative line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

;; infinitely blinking cursor
(blink-cursor-mode 1)
(setq blink-cursor-blinks -1)

;; disabling visual clutter
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t)

;; removing gutters (fringes) on left and right
(set-fringe-mode 0)

;; disabling bell sound in favor of visual bell
(setq visible-bell t)

;; setting tab behavior
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; scrolloff
(setq scroll-margin 14)

;; minibuffer autocompletion
(icomplete-mode 1)

;; sort directories first in dired
(setq dired-listing-switches "-aBhl  --group-directories-first")

;; backup file location
(defvar --backup-directory (concat user-emacs-directory "backups"))
(if (not (file-exists-p --backup-directory))
    (make-directory --backup-directory t))
(setq backup-directory-alist `(("." . ,--backup-directory)))

;; backup file settings
(setq make-backup-files t
      version-control t
      kept-new-versions 10
      kept-old-versions 3
      delete-old-versions t
      delete-by-moving-to-trash t
      backup-by-copying t
      vc-make-backup-files t)

;; autosave file settings
(setq auto-save-default t
      auto-save-timeout 20
      auto-save-interval 200)

;; default shell config
(setq explicit-shell-file-name "zsh")
