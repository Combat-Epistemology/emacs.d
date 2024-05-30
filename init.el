;;Package repository setup===================================================
(require 'package)
;;;Code:
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives
	     '("elpa" . "https://https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives
	     '("nongnu" . "https://elpa.nongnu.org/nongnu/") t)
(package-initialize)
;;;Code:
(unless package-archive-contents
  (package-refresh-contents))

;;Initialize use-package macro on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;;==========================================================================

;;EMMS======================================================================

(use-package emms)

(emms-all)
(setq emms-player-list '(emms-player-vlc)
      emms-info-functions '(emms-info-native))

;;==========================================================================

;;Fonts=====================================================================
(set-face-attribute 'default nil
    :font "JetBrainsMonoNerdFont"
    :height 110
    :weight 'medium)

(set-face-attribute 'fixed-pitch nil
    :font "JetBrainsMonoNerdFont"
    :height 110
    :weight 'medium)

(add-to-list 'default-frame-alist '(font . "JetBrainsMonoNerdFont"))
;;==========================================================================

;;compat (Elisp compatability)===============================================

(use-package compat)

;;===========================================================================

;;All The Icons==============================================================

(use-package all-the-icons)

;;===========================================================================

;;avy jump package===========================================================

(use-package avy)
;; (use-package avy
;;   :bind (("C-c J" . avy-goto-line)
;; 	 ("C-:" . avy-goto-char))
;;       :commands avy-goto-line
;;       :init
;;       (setq-default
;;        ;; the unpredictability of this (when enabled) makes it a poor default
;;        avy-single-candidate-jump nil
;;        avy-background nil
;;        avy-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)
;;        avy-style 'at-full
;;        avy-all-windows 'all-frames))
;;===========================================================================

;;Code folding===============================================================

(use-package vimish-fold
    :config
    ;;set the folds to be persistent across sessions for all modes
    (vimish-fold-global-mode 1)
    :bind (("C-c F" . vimish-fold)
           ("C-c U" . vimish-fold-unfold)
	   ("C-c R" . vimish-fold-refold)))

;;===========================================================================

;;Doom Modeline=============================================================
 
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  )

;;===========================================================================

;;Flycheck==================================================================

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;;==========================================================================

;;Languages: clojure========================================================

(use-package clojure-mode)

;;==========================================================================

;;Languages: Perl===========================================================

;;Use cperl-mode as the default when editing perl files
;;(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))

;;(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
;;(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
;;(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))
(add-to-list 'major-mode-remap-alist '(perl-mode . cperl-mode))

;;Turn off whitespace being displayed as underscores
(setq cperl-invalid-face nil)

;;Turn on keyword expansion
(setq cperl-electric-keywords t)

;;==========================================================================

;;Languages:Scala==========================================================

(use-package scala-mode
  :interpreter ("scala" . scala-mode))

;; (use-package sbt-mode
;;   :commands sbt-start sbt-command
;;   :config
;;   (substitute-key-definition
;;    'minibuffer-complete-word
;;    'self-insert-command
;;    minibuffer-local-completion-map)
;;   (setq sbt:program-options '("-Dsbt.supershell=false")))

;;=========================================================================

;;Languages: Web===========================================================

(use-package web-mode)

(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
	     
;;=========================================================================

;;Languages:eglot==========================================================

;;(use-package eglot
;;  :pin melpa-stable
;;  :hook (scala-mode . eglot.ensure))
  
;;=========================================================================

;;Orderless================================================================

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

;;=========================================================================


;;Terminals=================================================================

(use-package eshell-syntax-highlighting
    :after esh-mode
    :config
    (eshell-syntax-highlighting-global-mode +1))

(setq eshell-rc-script (concat user-emacs-directory "eshell/profile")
        eshell-aliases-file (concat user-emacs-directory "eshell/aliases")
        eshell-history-size 5000
        eshell-buffer-maximum-lines 5000
        eshell-hist-ignoredups t
        eshell-scroll-to-bottom-on-input t
        eshell-destroy-buffer-when-process-dies t
        eshell-visual-commands'("bash" "fish" "htop" "ssh" "top" "zsh"))

(use-package eat
  :ensure t)

;;(use-package vterm)
;;(setq shell-file-name "/bin/bash"
;;      vterm-max-scrollback 5000)
;;==========================================================================

;;Vertico===================================================================

(use-package vertico
  :init
  (vertico-mode))

(setq vertico-cycle t)

;;==========================================================================

;;Visible Bell==============================================================

(setq visible-bell t)

;;==========================================================================


;;Which-Key=================================================================

(use-package which-key
  :init (which-key-mode)
  :diminish (which-key-mode)
  :config
  (setq which-key-idle-delay 1))

;;==========================================================================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(emms cider clojure-mode lsp-treemacs lsp-ui lsp-mode denote evil orderless flycheck doom-modeline all-the-icons which-key eat vterm eshell-syntax-highlighting compat vertico web-mode vimish-fold avy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
