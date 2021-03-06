;;; evil/plugins.el -*- lexical-binding: t; -*-

(use-package evil-commentary
  :commands (evil-commentary
             evil-commentary-yank)
  :init
  (general-define-key
   :states 'normal
   "gc" #'evil-commentary
   "gy" #'evil-commentary-yank))

(use-package evil-escape
  :demand :after evil
  :config
  (setq-default evil-escape-key-sequence "fj"
                evil-escape-unordered-key-sequence t)
  (evil-escape-mode))

(use-package evil-exchange
  :commands evil-exchange
  :init
  (general-define-key
   :states '(normal visual)
   "zx" #'evil-exchange)
  :config
  ;; Cancel exchange on escape.
  (defun my/escape-evil-exchange ()
    "Cancel evil-exchange."
    (when evil-exchange--overlays
      (evil-exchange-cancel)
      t))
  (add-hook 'my/escape-hook #'my/escape-evil-exchange))

(use-package evil-owl
  :demand :after evil
  :config
  (if (featurep 'posframe)
      (setq evil-owl-display-method 'posframe
            evil-owl-extra-posframe-args
            '(:width 50 :height 20
                     :internal-border-width 2
                     :internal-border-color "black")
            evil-owl-max-string-length 50)
    (setq evil-owl-display-method 'window
          evil-owl-max-string-length 500)
    (add-to-list 'display-buffer-alist
                 '("*evil-owl*"
                   (display-buffer-in-side-window)
                   (side . bottom)
                   (window-height . 0.5))))
  (evil-owl-mode))

(use-package evil-snipe
  :demand :after evil
  :config
  (add-to-list 'evil-snipe-disabled-modes 'pdf-view-mode)
  (evil-snipe-mode 1)
  (evil-snipe-override-mode 1))

(use-package evil-surround
  :commands (evil-surround-edit
             evil-Surround-edit
             evil-surround-region
             evil-surround-region)
  :init
  (general-define-key
   :states 'operator
   "s" #'evil-surround-edit
   "S" #'evil-Surround-edit)
  (general-define-key
   :states 'visual
   "s" #'evil-surround-region
   "S" #'evil-Surround-region))

(use-package evil-visualstar
  :commands (evil-visualstar/begin-search-forward
             evil-visualstar/begin-search-backward)
  :init
  (general-define-key
   :states 'visual
   "*" #'evil-visualstar/begin-search-forward
   "#" #'evil-visualstar/begin-search-backward))
