(in-package "ACL2")

;; The machine also has an independent storage model; this is similar in
;; concept to the memory but rather than a byte array, it is a word-
;; addressable word array.

;; (include-book "std/alists/top" :dir :system)

(defun mk-empty-storage () nil)
