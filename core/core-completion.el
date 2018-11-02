;;; core-completion.el --- Completion settings -*- lexical-binding: t; -*-

;;; Ivy

(use-package ivy
  :demand
  :bind (:map ivy-minibuffer-map
              ("C-j" . ivy-immediate-done)
              ("RET" . ivy-alt-done))
  :config
  (setq ivy-count-format "(%d/%d) "
        ivy-fixed-height-minibuffer t
        ;; Highlight whole line.
        ivy-format-function #'ivy-format-function-line
        ivy-height 10
        ;; No ^ initially.
        ivy-initial-inputs-alist nil
        ivy-magic-slash-non-match-action nil
        ;; Use current prompt as a candidate.
        ivy-use-selectable-prompt t
        ivy-wrap t)
  (ivy-set-actions t '(("y" kill-new "yank")))
  (ivy-mode 1))

(use-package counsel
  :config
  (setq counsel-find-file-ignore-regexp
        (concat
         ;; File names beginning with `#` or `.`.
         "\\(?:\\`[#.]\\)"
         ;; File names ending with `#` or `~`.
         "\\|\\(?:\\`.+?[#~]\\'\\)")))

;; Prioritize most used commands in counsel-M-x.
(use-package amx
  :after counsel)

(use-package swiper)

;;; Company

(use-package company
  :demand
  :commands company-complete-common
  :config
  (setq company-idle-delay nil
        company-frontends
        '(company-pseudo-tooltip-frontend
          company-echo-metadata-frontend)
        company-require-match 'never
        company-tooltip-align-annotations t
        company-dabbrev-downcase nil
        company-dabbrev-ignore-case nil
        company-dabbrev-code-other-buffers t
        )
 (global-company-mode 1))

(provide 'core-completion)
;;; core-completion.el ends here
