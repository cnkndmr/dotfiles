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


;; ORG BULLETS
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(cua-mode t nil (cua-base))
 '(display-line-numbers (quote relative))
 '(global-visual-line-mode t)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(org-support-shift-select (quote always))
 '(package-selected-packages
   (quote
    (org-bullets markdown-mode cyberpunk-theme use-package)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(user-full-name "M. Can Kandemir")
 '(user-mail-address "cnkndmr@gmail.com"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu" :foundry "DAMA" :slant normal :weight normal :height 120 :width normal)))))
