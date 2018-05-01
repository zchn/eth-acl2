(in-package "ACL2")

(local (include-book "std/lists/top" :dir :system))

(include-book "base")

;; The memory model is a simple word-addressed byte array.

(defun mk-empty-memory () nil)

(defun memory/validp (memory)
  (true-listp memory))

(defun memory/load-byte (memory addr)
  (modfix-byte (nth addr memory)))

(defun memory/load-byte-array (memory mem-start mem-len)
  (if (zp mem-len) nil
    (cons (memory/load-byte memory mem-start)
          (memory/load-byte-array memory (1+ mem-start) (1- mem-len)))))

(defun memory/load-w256 (memory addr)
  (w-from-bytes (memory/load-byte-array memory addr 32)))

(defun memory/store-byte (memory addr value)
  (update-nth addr value memory))

(defun memory/store-byte-array (memory addr array)
  (if (consp array)
      (memory/store-byte-array (memory/store-byte memory addr (car array))
                               (1+ addr)
                               (cdr array))
    memory))

(defun memory/store-w256 (memory addr value)
  (memory/store-byte-array memory addr (w-to-bytes value 32)))
