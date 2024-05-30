;;Backups====================================================================
(setq backup-directory-alist '(("." . "~/.emacs.d/emacs_backups/")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)
;;===========================================================================

;;File Handling==============================================================
(recentf-mode 1)

(save-place-mode 1)

(global-auto-revert-mode 1)
;;===========================================================================

;;Graphical User interface setup.============================================

;;Disable Menubar, Toolbars and Scrollbars
(menu-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(scroll-bar-mode -1)

;;Disable splash screen
(setq inhibit-startup-message t)
(setq inhibit-scratch-message t)

;;Display line numbers and truncated lines
(global-display-line-numbers-mode 1)
(global-visual-line-mode t)

;;A Little Breathing room====================================================
(set-fringe-mode 10)
;;===========================================================================

;;Minibuffer=================================================================
(setq history-length 25)
(savehist-mode 1)

;;Turn off floating dialog boxes.  Send messages to minibuffer instead.
(setq use-dialog-box nil)
;;===========================================================================

;;Fonts======================================================================
(set-face-attribute 'font-lock-comment-face nil
    :slant 'italic)

(set-face-attribute 'font-lock-keyword-face nil
    :slant 'italic)

(setq-default linespacing 0.12)
;;===========================================================================

;;Theme======================================================================
(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs_themes")
(load-theme 'tron-legacy t)
(setq tron-legacy-theme-softer-bg t)
;;===========================================================================

;;Transparency===============================================================
(add-to-list 'default-frame-alist '(alpha-background . 90))
;;===========================================================================
