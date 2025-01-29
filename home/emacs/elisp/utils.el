;; ------------------
;; - elisp/utils.el -
;; ------------------

;; setting up counsel, ivy, and swiper
(use-package counsel
  :ensure t
  :diminish
  :bind (("C-s" . swiper)
    ; ("M-x" . counsel-M-x)
    ; ("C-x b" . counsel-ibuffer)
    ; ("C-x C-f" . counsel-find-file)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)	
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

;; adding helpful describe functionality and integration with counsel
(use-package helpful
  :ensure t)
  ;:custom
  ; (counsel-describe-function-function #'helpful-callable)
  ; (counsel-describe-variable-function #'helpful-variable)
  ;:bind
  ; ([remap describe-function] . counsel-describe-function)
  ; ([remap describe-command] . helpful-command)
  ; ([remap describe-variable] . counsel-describe-variable)
  ; ([remap describe-key] . helpful-key))

;; show all functions from key inputs
(use-package which-key
  :ensure t
  :init
  (setq which-key-idle-delay 0.01)
  :config
  (which-key-mode)
  :diminish which-key-mode)
