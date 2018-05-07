(in-package "ACL2")

(local (include-book "arithmetic/rationals" :dir :system))
(local (include-book "ihs/quotient-remainder-lemmas" :dir :system))

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

(defun expt-w256 (r i)
  (declare (xargs :measure (nfix i)))
  (if (< (nfix i) 5) (modfix-w256 (expt r (nfix i)))
      (modfix-w256
       (* (modfix-w256 (expt (expt-w256 r (floor (nfix i) 2)) 2))
          (modfix-w256 (expt r (mod (nfix i) 2)))))))

(defun signed-to-unsigned-nbits (i n)
  (mod (ifix i) (expt 2 (nfix n))))

(defun signed-to-unsigned-w256 (i)
  (signed-to-unsigned-nbits i 256))

(defun unsigned-to-signed-nbits (n nbits)
  (let* ((fixed-nbits (nfix nbits))
         (fixed (mod (nfix n) (expt 2 fixed-nbits))))
    (if (>= fixed (expt 2 (1- fixed-nbits))) (- fixed (expt 2 fixed-nbits))
        fixed)))

(defun unsigned-to-signed-w256 (n)
  (unsigned-to-signed-nbits n 256))

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
