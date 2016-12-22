;;; funcs.el --- Elixir Layer functions File for Spacemacs
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun spacemas//elixir-looking-back-spaces-p (expr)
  (save-excursion
    (while (looking-back " ") (backward-char))
    (looking-back expr)))

(defun spacemacs//elixir-do-end-close-action (id action context)
  (when (eq action 'insert)
    (if (spacemas//elixir-looking-back-spaces-p id)
        (progn (insert " ") (backward-char))
      (progn (newline-and-indent)
             (forward-line -1)
             (indent-according-to-mode)))))

(defun spacemacs//elixir-enable-compilation-checking ()
  "Enable compile checking if `elixir-enable-compilation-checking' is non nil."
  (when (or elixir-enable-compilation-checking)
    (flycheck-mix-setup)))
