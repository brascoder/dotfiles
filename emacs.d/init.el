;;; Config --- Brasco's Emacs config
;;; Commentary:

;;; Code:

;; defaults
(fset 'yes-or-no-p 'y-or-n-p)
(global-display-line-numbers-mode)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-hook 'prog-mode-hook 'hl-line-mode)

(setq make-backup-files nil
      scroll-conservatively 1000
      indent-tabs-mode nil
      ;; ruby-insert-encoding-magic-comment nil
      auto-save-default nil
      standard-indent 2
      js-indent-level 2
      inhibit-startup-screen t
      ring-bell-function 'ignore
      path-to-ctags "/usr/local/bin/ctags"
      initial-scratch-message (concat initial-scratch-message (concat "emacs-init-time: " (emacs-init-time)))
      debug-on-error t
      highlight-indent-guides-method 'character
      )

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

(defun create-tags (dir-name)
  "Create tags file at DIR-NAME."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f tags -e -R %s" path-to-ctags (directory-file-name dir-name))))

(defun copy-full-path-to-kill-ring ()
  "Copy buffer's full path to kill ring."
  (interactive)
  (when buffer-file-name
    (kill-new (file-relative-name buffer-file-name (projectile-project-root)))))

;; package.el
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
                         ))
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
                                  highlight-indent-guides

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
				  robe

				  ;; treemacs
				  treemacs
				  treemacs-evil

				  vterm
				  persp-mode
                                  ))

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
  (evil-mode 1)
  )

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init)
  )

(use-package projectile
  :config
  (setq projectile-completion-system 'ivy)
  (projectile-mode 1)
  )

;; which-key
(use-package which-key
  :init
  (which-key-mode 1)
  (push '((nil . "projectile-\\(.+\\)") . (nil . "\\1"))
        which-key-replacement-alist)
  (push '((nil . "persp-\\(.+\\)") . (nil . "\\1"))
	which-key-replacement-alist)
  )

;; general
(use-package general
  :config

  (general-create-definer leader-define
    :prefix "SPC")

  (leader-define 'normal
    "p" '(:keymap projectile-command-map :which-key "projectile")
    "qq" #'save-buffers-kill-terminal
    ";" '(:keymap persp-key-map :package persp-mode :wk "persp-mode")
    )

  (leader-define 'motion 'override
    "SPC" #'counsel-M-x
    "/" #'counsel-ag
    "w" '(:keymap evil-window-map :package evil :wk "window")
    "h" '(:keymap help-map :wk "help")
    )

  (leader-define 'visual
    "cc" #'comment-dwim
    )

  (leader-define 'normal
    :infix "b"
    "" '(:ignore t :which-key "buffer")
    "b" #'ivy-switch-buffer
    "d" #'kill-current-buffer
    "D" #'kill-some-buffers
    "n" #'next-buffer
    "p" #'previous-buffer
    "s" #'open-scratch-buffer
    )

  (leader-define 'normal
    :infix "c"
    "" '(:ignore t :which-key "code")
    "c" #'comment-line
    )

  (leader-define 'normal
    :infix "e"
    "" '(:ignore t :which-key "environment")
    "e" #'eval-init-file
    "f" #'find-init-file
    "p" '(:ignore t :which-key "packages")
    "pr" #'refresh-packages
    "t" '(:ignore t :which-key "Terminal")
    "tt" #'vterm
    )

  (leader-define 'normal
    :infix "f"
    "" '(:ignore t :which-key "file")
    "c" #'copy-file
    "d" #'dired
    "f" #'find-file
    "i" #'imenu
    "p" #'copy-full-path-to-kill-ring
    "s" #'save-buffer
    "t" #'treemacs
    )
  
  (leader-define '(normal visual)
    :infix "g"
    "" '(:ignore t :which-key "magit")
    "b" #'magit-blame
    "g" #'magit-status
    )
  
  (leader-define 'normal
    :infix "s"
    "" '(:ignore t :which-key "search")
    "b" #'counsel-grep-or-swiper
    "p" #'counsel-rg
    )
  )

;; ivy
(use-package ivy
  :config
  (setq ivy-use-virtual-buffers t
	ivy-height 20
	ivy-use-selectable-prompt t
	ivy-wrap t
	;; ivy-re-builders-alist
        ;; '((t . ivy--regex-fuzzy))
        )

  (ivy-mode 1)
  )

;; magit
(use-package magit
  :commands magit-status
  :config
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)
  )

(use-package evil-magit
  :after magit
  )

(use-package treemacs
  :commands treemacs
  :config
  (treemacs-follow-mode -1)
  )

(use-package treemacs-evil
  :after treemacs
  )

(use-package company
  :init
  (global-company-mode)
  :config
  (setq company-minimum-prefix-length 0
	company-idle-delay 0.1)
  (push 'company-robe company-backends)
  )

(use-package flycheck
  :init
  (global-flycheck-mode)
  )

(use-package undo-tree
  :config
  (setq undo-tree-visualizer-diff t
	undo-tree-visualizer-timestamps t)
  (global-undo-tree-mode)
  )

(use-package web-mode
  :mode ("\\.erb\\'" . web-mode)
  )

(use-package slim-mode
  :mode "\\.slim\\'"
  )

(use-package yaml-mode
  :mode "\\.yml\\'"
  )

(use-package robe
  :diminish robe-mode
  :config
  (add-hook 'ruby-mode-hook 'robe-mode)
  )

(use-package persp-mode
  :config
  (persp-mode 1)
  )

(use-package vterm
  )

(use-package highlight-indent-guides
  :config
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  )

;;; init.el ends here
