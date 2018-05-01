(in-package "ACL2")

(local (include-book "arithmetic/top" :dir :system))
(local (include-book "ihs/quotient-remainder-lemmas" :dir :system))

(include-book "base")

(defthm evm-bytep-modfix-byte
    (evm-bytep (modfix-byte n)))

(defthm evm-w256p-modfix-w256
    (evm-w256p (modfix-w256 n)))

(defthm modfix-w256-lt-2-256
    (<= (modfix-w256 n) 115792089237316195423570985008687907853269984665640564039457584007913129639936))

;; TODO(zchn): Prove the follow defthm.
;; (defthm w-from-bytes-lt-expt-256-len
;;     (implies (consp byte-array)
;;              (< (w-from-bytes byte-array) (expt 256 (len byte-array)))))
