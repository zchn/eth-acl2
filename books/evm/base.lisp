(in-package "ACL2")

(defun evm-bytep (n)
  (and (natp n)
       (< n 256)))

(defun evm-byte-arrayp (array)
  (if (consp array)
      (and (evm-bytep (car array)) (evm-byte-arrayp (cdr array)))
      (equal array nil)))

(defun fix-byte (n)
  (let ((n-fixed (nfix n)))
    (if (zp n-fixed) 0
        (if (< n-fixed 256) n-fixed 255))))

(defun evm-w256p (n)
  (and (natp n)
       (< n (expt 2 256))))

(defun fix-w256 (n)
  (let ((n-fixed (nfix n)))
    (if (zp n-fixed) 0
        (if (< n-fixed (expt 2 256)) n-fixed (1- (expt 2 256))))))

(defun w-from-bytes (byte-list)
  (if (consp byte-list)
      (if (cdr byte-list)
          (+ (* (fix-byte (car byte-list)) 256)
             (w-from-bytes (cdr byte-list)))
          (fix-byte (car byte-list)))
      0))

(defun w-to-bytes (n byte-len)
  (if (zp byte-len) nil
      (append (w-to-bytes (floor n 256) (1- byte-len))
              (list (mod n 256)))))
