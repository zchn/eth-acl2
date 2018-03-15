(in-package "ACL2")

(include-book "std/alists/top" :dir :system)

;; The memory model is a simple word-addressed byte array.

(defun mk-empty-memory () nil)

(defun memory/load (memory addr)
  (assoc addr memory))

(defun memory/store (memory addr value)
  (put-assoc addr value memory))

(defun memory/store-byte-array (memory addr array)
  (if (consp array)
      (memory/store-byte-array (memory/store memory addr (car array))
                               (1+ addr)
                               (cdr array))
    memory))
