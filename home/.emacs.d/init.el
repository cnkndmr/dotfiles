(require 'package)
(package-initialize)

;; Add `melpa` to `package-archives`.
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(setq-default frame-title-format '("%b [%m]"))

;;; Highligt line:
(global-hl-line-mode)

;; ORG BULLETS
(use-package org-bullets
  :init
  (add-hook 'org-mode-hook 'org-bullets-mode))

(use-package cyberpunk-theme
  :ensure t)

(use-package linum-relative
  :ensure t)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "/opt/anaconda/bin/pandoc"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(cua-mode t nil (cua-base))
 '(custom-buffer-indent 4)
 '(custom-enabled-themes '(cyberpunk))
 '(custom-safe-themes
   '("2d835b43e2614762893dc40cbf220482d617d3d4e2c35f7100ca697f1a388a0e" default))
 '(electric-pair-mode t)
 '(global-visual-line-mode t)
 '(inhibit-startup-screen t)
 '(linum-relative-current-symbol "")
 '(linum-relative-global-mode t)
 '(make-backup-files nil)
 '(markdown-command "/opt/anaconda/bin/pandoc" t)
 '(menu-bar-mode nil)
 '(org-babel-load-languages '((shell . t)))
 '(org-confirm-babel-evaluate nil)
 '(org-export-backends '(ascii beamer html icalendar latex man md odt org texinfo))
 '(org-file-apps
   '((auto-mode . emacs)
	 ("\\.pdf::\\([0-9]+\\)?\\'" . "/usr/bin/zathura %s -P %1")
	 ("\\.pdf\\'" . "/usr/bin/zathura %s")))
 '(org-support-shift-select t)
 '(package-selected-packages
   '(linum-relative diff-hl markdown-preview-mode company org-bullets markdown-mode cyberpunk-theme use-package))
 '(scroll-bar-mode nil)
 '(scroll-step 1)
 '(show-paren-mode t)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(user-full-name "M. Can Kandemir")
 '(user-mail-address "cnkndmr@gmail.com"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu" :foundry "DAMA" :slant normal :weight normal :height 120 :width normal)))))
