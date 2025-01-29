;; ------------
;; - init.el -
;; ------------

;; setting up package archives
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			   ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(setq use-package-always-ensure t)

;; adding other config files
(add-to-list 'load-path "~/.dotfiles/home/emacs/elisp/")
(load-library "lsp")
(load-library "keys")
(load-library "utils")
(load-library "syntax")
(load-library "config")
(load-library "appearance")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(yasnippet-snippets rust-mode yasnippet powershell tsx-mode treemacs-icons-dired undo-tree company-box lsp-ui lsp-mode doom-themes doom-modeline dashboard which-key helpful counsel 1 evil-collection evil company)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; TODO: customize dashboard, look into projectile, look into consult, maybe ditch counsel in favor of icomplete-mode
