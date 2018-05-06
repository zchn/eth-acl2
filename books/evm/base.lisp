(in-package "ACL2")

(defun evm-bytep (n)
  (and (natp n)
       (< n 256)))

(defun evm-byte-arrayp (array)
  (if (consp array)
      (and (evm-bytep (car array)) (evm-byte-arrayp (cdr array)))
      (equal array nil)))

(defun modfix-byte (n)
  (mod (nfix n) 256))

(defun evm-w256p (n)
  (and (natp n)
       (< n (expt 2 256))))

(defun modfix-w256 (n)
  (mod (nfix n) (expt 2 256)))

;; Convert a negative integer to it's w256 two's complement. Keep
;; non-negative numbers untouched.
(defun neg-to-unsigned-w256 (i)
  (let ((ifixed (ifix i)))
    (if (>= ifixed 0) ifixed
        (mod ifixed (expt 2 256)))))

(defun w-from-bytes (byte-list)
  (if (consp byte-list)
      (if (cdr byte-list)
          (+ (* (modfix-byte (car byte-list)) (expt 256 (1- (len byte-list))))
             (w-from-bytes (cdr byte-list)))
          (modfix-byte (car byte-list)))
      0))

(defun w-to-bytes (n byte-len)
  (if (zp byte-len) nil
      (append (w-to-bytes (floor n 256) (1- byte-len))
              (list (mod n 256)))))
