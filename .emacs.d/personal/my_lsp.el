
(use-package lsp-mode
  :hook ((latex-mode plain-tex-mode) . lsp-deferred)
  :config
  (add-hook 'c++-mode-hook #'lsp)
  (add-hook 'python-mode-hook #'lsp)
  (add-hook 'rust-mode-hook #'lsp)
  (add-hook 'tex-mode-hook 'lsp)
  (add-hook 'latex-mode-hook 'lsp))

(require 'lsp-latex)
;; "texlab" must be located at a directory contained in `exec-path'.
;; If you want to put "texlab" somewhere else,
;; you can specify the path to "texlab" as follows:
(setq lsp-latex-texlab-executable "/usr/bin/texlab")


(require 'eglot)
(require 'company-lsp)
(add-to-list 'company-lsp-filter-candidates '(digestif . nil))
