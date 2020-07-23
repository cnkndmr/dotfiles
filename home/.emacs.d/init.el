;; Require and initialize `package`.
(require 'package)
(package-initialize)

;; Add `melpa` to `package-archives`.
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(use-package cyberpunk-theme
  :ensure t)

(setq-default frame-title-format '("%f [%m]"))

;;;; Highligt line
(global-hl-line-mode)

;; ORG BULLETS
(use-package org-bullets
  :init
  (add-hook 'org-mode-hook 'org-bullets-mode))

(use-package cyberpunk-theme
  :ensure t)

(use-package linum-relative
  :ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(cua-mode t nil (cua-base))
 '(global-visual-line-mode t)
 '(inhibit-startup-screen t)
 '(linum-relative-current-symbol "")
 '(linum-relative-global-mode t)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(org-babel-load-languages (quote ((shell . t))))
 '(org-confirm-babel-evaluate nil)
 '(org-file-apps
   (quote
	((auto-mode . emacs)
	 ("\\.pdf::\\([0-9]+\\)?\\'" . "/usr/bin/evince %s -i %1")
	 ("\\.pdf\\'" . "/usr/bin/evince %s"))))
 '(org-support-shift-select t)
 '(package-selected-packages
   (quote
    (org-bullets markdown-mode cyberpunk-theme use-package)))
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
