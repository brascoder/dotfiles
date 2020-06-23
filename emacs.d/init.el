;; functions
(defun refresh-packages ()
  "Refresh and install packages."
  (interactive)
  (package-refresh-contents)
  (package-install-selected-packages)
  (package-autoremove))

(defun find-init-file ()
  "Go to init file (ie this one)."
  (interactive)
  (find-file user-init-file))

(defun eval-init-file ()
  "Eval init file (ie this one)."
  (interactive)
  (load-file user-init-file))

;; package.el
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")))
(package-initialize)
(setq package-selected-packages '(;; core
				  solarized-them
				  use-package
				  ;; keybindings
				  which-key
				  general

				  ;; Completion
				  counsel ;; ivy and swiper
				  
				  ;; magit
				  magit
				  evil-magit

				  treemacs
				  treemacs-evil))

;; theme
(load-theme 'solarized-dark t)

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))
(setq use-package-compute-statistics t)

;; evil
(use-package evil
  :init
  (setq evil-want-C-u-scroll t
	evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; which-key
(use-package which-key
  :init
  (which-key-mode 1))

;; general
(use-package general
  :config

  (general-create-definer leader-define
    :prefix "SPC")

  (leader-define 'normal
    "qq" #'save-buffers-kill-terminal)

  (leader-define 'normal
    :infix "b"
    "" '(:ignore t :which-key "buffer")
    "b" #'ivy-switch-buffer)

  (leader-define 'normal
    :infix "e"
    "" '(:ignore t :which-key "environment")
    "e" #'eval-init-file
    "f" #'find-init-file
    "p" '(:ignore t :which-key "packages")
    "pr" #'refresh-packages)

  (leader-define 'normal
    :infix "f"
    "" '(:ignore t :which-key "file")
    "f" #'find-file
    "s" #'save-buffer)
  
  (leader-define '(normal visual)
    :infix "g"
    "" '(:ignore t :which-key "magit")
    "g" #'magit-status)
  
  (leader-define 'normal
    :infix "s"
    "" '(:ignore t :which-key "search")
    "b" #'counsel-grep-or-swiper
    "p" #'counsel-rg))

;; ivy
(use-package ivy
  :config
  (setq ivy-use-virtual-buffers t
	ivy-height 20
	ivy-use-selectable-prompt t
	ivy-wrap t)
  (ivy-mode 1))

;; magit
(use-package magit
  :commands magit-status
  :config
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1))

(use-package evil-magit
  :after magit)
