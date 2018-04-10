(in-package "ACL2")

(defun evm-w256p (n)
  (integerp n))

(defun fix-w256 (n)
  (mod (fix n) (expt 2 256)))
