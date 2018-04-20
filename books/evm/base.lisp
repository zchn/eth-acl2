(in-package "ACL2")

(defun evm-bytep (n)
  (and (natp n)
       (< n 256)))

(defun fix-byte (n)
  (let ((n-fixed (nfix n)))
    (if (zp n-fixed) 0
        (if (< n-fixed 256) n-fixed 0))))

(defun evm-w256p (n)
  (and (natp n)
       (< n (expt 2 256))))

(defun fix-w256 (n)
  (let ((n-fixed (nfix n)))
    (if (zp n-fixed) 0
        (if (< n-fixed (expt 2 256)) n-fixed 0))))

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

(defun evm-repeat (n x)
  (if (zp n) nil
      (cons x (evm-repeat (1- n) x))))
