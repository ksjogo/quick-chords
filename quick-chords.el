;;; quick-chords.el --- preconfigured emacs key-chords for easy typing

;; Author: Johannes Goslar
;; Created: 4 July 2016
;; Version: 0.1.0
;; Package-Requires: ((emacs "24.4") (key-chords "0.6"))
;; Keywords: keyboard chord input
;; URL: https://github.com/ksjogo/quick-chords

;; Copyright (C) 2016 Johannes Goslar

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;;; Code:

(defgroup quick-chords nil
  "Quick key chords."
  :group 'environment)

(defcustom quick-chords-bindings
  `((",," quick-chords-semicolon)
    ("xk" kill-this-buffer)
    ("hk" describe-key)
    ("hf" describe-function)
    ("hv" describe-variable)
    (",." eval-expression))
  "The list of quick key bindings"
  :group 'quick-chords
  :type '(repeat (list string function)))

(defun quick-chords-semicolon ()
  (interactive)
  (save-excursion
    (end-of-line)
    (insert ";")))

;;;###autoload
(define-minor-mode quick-chords-mode "" :global t
  (if quick-chords-mode
      (progn
        (key-chord-mode 1)
        (dolist (pair quick-chords-bindings)
          (key-chord-define-global (car pair) (cadr pair))))
    (progn
      (dolist (pair quick-chords-bindings)
        (key-chord-unset-global (car pair))))))

(provide 'quick-chords)
;;; quick-chords.el ends here
