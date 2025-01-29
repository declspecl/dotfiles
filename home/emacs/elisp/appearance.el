;; -----------------------
;; - elisp/appearance.el -
;; -----------------------

;; general configuration
(set-face-attribute 'default nil :font "Iosevka Nerd Font Mono" :height 180)

;; startup dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

;; required icon pack for doom-modeline
(use-package nerd-icons
  :ensure t)

;; modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; doom themes
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-ayu-dark t)

  ;; Enable custom neotree theme (all-the-icons must be installed!)
  ;; (doom-themes-neotree-config)
  ;; or for treemacs users
  ;; (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  ;; (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; dired customization
(use-package treemacs-icons-dired
  :ensure t
  :config (treemacs-icons-dired-mode))

(add-hook 'dired-mode-hook
          (lambda ()
            (dired-hide-details-mode)))
