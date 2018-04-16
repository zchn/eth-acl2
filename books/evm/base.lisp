(in-package "ACL2")

(defun evm-bytep (n)
  (and (natp n)
       (<= n 256)))

(defun fix-byte (n)
  (mod (fix n) 256))

(defun evm-w256p (n)
  (integerp n))

(defun fix-w256 (n)
  (mod (fix n) (expt 2 256)))

(defun w-from-bytes (byte-list)
  (if (consp byte-list)
      (if (cdr byte-list)
          (+ (* (car byte-list) 256)
             (w-from-bytes (cdr byte-list)))
          (car byte-list))
      0))

(defun w-to-bytes (n byte-len)
  (if (zp byte-len) nil
      (append (w-to-bytes (floor n 256) (1- byte-len))
              (list (mod n 256)))))
