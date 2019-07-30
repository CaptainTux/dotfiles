;;; package --- Summary: LaTeX.el

;;; Commentary: For use with pdf-tools when compiling LaTeX code

;;; Code:

;; (require 'tex)
;; (require 'tex-site)

(load "auctex.el" nil t t)
;; (load "preview-latex.el" nil t t)

(pdf-tools-install)

;; (require 'company-auctex)
;; (company-auctex-init)


;; (add-hook 'LaTeX-mode-hook #'latex-extra-mode)

;; Use pdf-tools to open PDF files
(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-source-correlate-start-server t)


;; Use pdf-tools to open PDF files
(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-source-correlate-start-server t)

;; Update PDF buffers after successful LaTeX runs
(add-hook 'TeX-after-compilation-finished-functions
          #'TeX-revert-document-buffer)

(setq TeX-auto-save t)

;; (add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)   ; with AUCTeX LaTeX mode

(custom-set-variables '(LaTeX-command "latex -synctex=1") )

;; (setq TeX-source-correlate-mode t)

;; (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;; (add-hook 'LaTeX-mode-hook #'LaTeX-preview-setup)


;;; LaTeX.el ends here
