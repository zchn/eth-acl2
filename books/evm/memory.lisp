(in-package "ACL2")

(include-book "std/alists/top" :dir :system)

;; The memory model is a simple word-addressed byte array.

(defun mk-empty-memory () nil)

(defun memory/validp (memory) (listp memory))

(defun memory/load (memory addr)
  (assoc addr memory))

(defun memory/load-byte-array (memory mem-start mem-len)
  (if (zp mem-len) nil
    (cons (memory/load memory mem-start)
          (memory/load-byte-array memory (1+ mem-start) (1- mem-len)))))

(defun memory/store (memory addr value)
  (put-assoc addr value memory))

(defun memory/store-byte-array (memory addr array)
  (if (consp array)
      (memory/store-byte-array (memory/store memory addr (car array))
                               (1+ addr)
                               (cdr array))
    memory))
