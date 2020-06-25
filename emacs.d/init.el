;;; Config --- Brasco's Emacs config
;;; Commentary:

;;; Code:

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

(defun open-scratch-buffer ()
  "Open scratch buffer."
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*")))

;; defaults
(fset 'yes-or-no-p 'y-or-n-p)
(global-display-line-numbers-mode)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq make-backup-files nil
      scroll-conservatively 1000
      indent-tabs-mode nil
      ruby-insert-encoding-magic-comment nil
      auto-save-default nil
      standard-indent 2
      js-indent-level 2
      inhibit-startup-screen t
      ring-bell-function 'ignore
      initial-scratch-message (concat initial-scratch-message (concat "emacs-init-time: " (emacs-init-time)))
      debug-on-error t)

;; package.el
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")))
(package-initialize)
(setq package-selected-packages '(;; core
				  solarized-theme
				  use-package
				  evil
				  evil-collection
				  projectile
				  company
				  flycheck
                                  undotree

				  ;; keybindings
				  which-key
				  general

				  ;; Completion
				  counsel ;; ivy and swiper
				  
				  ;; magit
				  magit
				  evil-magit

				  ;; language
				  web-mode
				  slim-mode
				  yaml-mode

				  ;; treemacs
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

(use-package projectile
  :config
  (setq projectile-completion-system 'ivy)
  (projectile-mode 1))

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

  (leader-define 'motion 'override
    "SPC" #'counsel-M-x
    "/" #'counsel-ag
    "w" '(:keymap evil-window-map :package evil :wk "window")
    "h" '(:keymap help-map :wk "help"))

  (leader-define 'visual
    ";" #'comment-dwim)

  (leader-define 'normal
    :infix "b"
    "" '(:ignore t :which-key "buffer")
    "b" #'ivy-switch-buffer
    "d" #'kill-current-buffer
    "n" #'next-buffer
    "p" #'previous-buffer
    "s" #'open-scratch-buffer)

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
    "s" #'save-buffer
    "t" #'treemacs)
  
  (leader-define '(normal visual)
    :infix "g"
    "" '(:ignore t :which-key "magit")
    "g" #'magit-status)

  (leader-define 'normal
    "p" '(:keymap projectile-command-map :wk "projectile"))
  
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
	ivy-wrap t
	ivy-re-builders-alist
	'((t . ivy--regex-fuzzy)))

  (ivy-mode 1))

;; magit
(use-package magit
  :commands magit-status
  :config
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1))

(use-package evil-magit
  :after magit)

(use-package treemacs
  :commands treemacs
  :config
  (treemacs-follow-mode -1))

(use-package treemacs-evil
  :after treemacs)

(use-package company
  :init
  (global-company-mode)
  :config
  (setq company-minimum-prefix-length 0
	company-idle-delay 0.1))

(use-package flycheck
  :init
  (global-flycheck-mode))

(use-package undo-tree
  :config
  (setq undo-tree-visualizer-diff t
	undo-tree-visualizer-timestamps t)
  (global-undo-tree-mode))

(use-package web-mode
  :mode ("\\.erb\\'" . web-mode))

(use-package slim-mode
  :mode "\\.slim\\'")

(use-package yaml-mode
  :mode "\\.yml\\'")

;;; init.el ends here