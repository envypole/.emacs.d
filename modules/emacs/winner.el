;;; emacs/winner.el -*- lexical-binding: t; -*-

(use-package winner ; built-in
  :demand
  :config
  (setq winner-dont-bind-my-keys t)
  (winner-mode 1))
