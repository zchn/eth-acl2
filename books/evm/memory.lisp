(in-package "ACL2")

(include-book "std/lists/top" :dir :system)

(include-book "base")

;; The memory model is a simple word-addressed byte array.

(defund mk-empty-memory () nil)

(defund memory/validp (memory)
  (or (not memory)
      (and (consp memory)
           (evm-bytep (car memory))
           (memory/validp (cdr memory)))))

(defund memory/load-byte (memory addr)
  (fix-byte (nth (fix-w256 addr) memory)))

(defun memory/load-byte-array (memory mem-start mem-len)
  (if (zp mem-len) nil
    (cons (memory/load-byte memory mem-start)
          (memory/load-byte-array memory (1+ mem-start) (1- mem-len)))))

(defun memory/load-w256 (memory addr)
  (w-from-bytes (memory/load-byte-array memory addr 32)))

(defun memory/zero-extend (memory mem-len)
  (append memory (repeat (nfix mem-len) 0)))

(defund memory/store-byte (memory addr value)
  (update-nth (fix-w256 addr) (fix-byte value)
              (memory/zero-extend memory (1+ (- (fix-w256 addr) (length memory))))))

(defun memory/store-byte-array (memory addr array)
  (if (consp array)
      (memory/store-byte-array (memory/store-byte memory addr (car array))
                               (1+ addr)
                               (cdr array))
    memory))

(defun memory/store-w256 (memory addr value)
  (memory/store-byte-array memory addr (w-to-bytes value 32)))
