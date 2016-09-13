;;; init.el --- johnjohn's init.el, A collection of crap that helps me type better
;;; Commentary:
;;;
;;; Exactly what it says on the tin
;;;
;;; Code:

;;; Load path
;;; No chickens here! (yet)

;;; Requires (pre-package-initialize)
(require 'package)

;;; Package listings
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;;; Requires (post-package-initialize)
(require 'company)
(require 'semantic)

;;; Toggles
;;; Disable menu bar by default (M-m re-enables)
(menu-bar-mode -1)

;;; Typeface and colors
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(flycheck-gcc-include-path
   (quote
    ("../include/" "../../include/" "../../../include" "~/Repos/Hydragine/include/")))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 83 :width normal)))))

;;; GGTags
(ggtags-mode 1)

;;; Semantic
(semantic-mode 1)
(global-semanticdb-minor-mode t)
(semantic-add-system-include "/usr/include/" 'c++-mode)
(semantic-add-system-include "../include/" 'c++-mode)

;;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;;; Company
(add-hook 'after-init-hook 'global-company-mode)
(company-mode 1)
(company-gtags 1)

;;; Keys
(global-set-key (kbd "<C-c l>") 'semantic-analyze-possible-completions)
(global-set-key (kbd "<M-down>") 'kill-this-buffer)
(global-set-key (kbd "M-m") 'menu-bar-mode)
(global-set-key (kbd "C-c M-f") 'projectile-find-file-dwim-other-window)
(global-set-key (kbd "s-d") 'dired)
(global-set-key (kbd "s-g u") 'ggtags-update-tags)
(global-set-key (kbd "s-g j") 'ggtags-find-tag-dwim)

(provide 'init)
;;; init.el ends here
