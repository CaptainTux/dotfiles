;;; package --- Summary: personal stuff

;;; Commentary:

;; FILL IN LATER

;;; Code:

;; (load-theme 'pink_2 t)

;; (require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)


;; (unless (package-installed-p 'use-package)
;;   (package-refresh-contents)
;;   (package-install 'use-package))


;; (require 'use-package)
;; (setq use-package-always-ensure t)

;; (require 'multiple-cursors)


;; (package-initialize)

;; (use-package benchmark-init
;;   :ensure t
;;   :config
;;   ;; To disable collection of benchmark data after init is done.
;;   (add-hook 'after-init-hook 'benchmark-init/deactivate))

(require 'helm)

;; (global-set-key (kbd "C-x C-f") 'helm-find-files)

(global-set-key (kbd "M-x") 'helm-M-x)

;; disable helm-history selection
(setq helm-move-to-line-cycle-in-source nil)

;; (global-set-key (kbd "C-s") 'search-forward)


(global-visual-line-mode t)

(scroll-bar-mode -1)

(set-frame-font "DejaVu Sans Mono-15" nil t)

;; turn on highlight matching brackets when cursor is on one
(show-paren-mode 1)

;; auto close bracket insertion. New in emacs 24
;; (electric-pair-mode 1)

;; jsx mode for react development
;; (add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))


(add-hook 'after-make-frame-functions
          (lambda (frame)
            (with-selected-frame frame
              (load-theme 'dracula_2 t))))


;; (set-frame-font "DejaVu Sans Mono-14" nil t)

;; (use-package recentf
;;   :defer t)


;;; 00_my_stuff.el ends here
