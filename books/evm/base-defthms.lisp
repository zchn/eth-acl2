(in-package "ACL2")

(include-book "base")

(include-book "arithmetic/top" :dir :system)

(defthm evm-bytep-fix-byte
    (evm-bytep (fix-byte n)))

(defthm evm-w256p-fix-w256
    (evm-w256p (fix-w256 n)))

(defthm fix-w256-lt-2-256
    (<= (fix-w256 n) 115792089237316195423570985008687907853269984665640564039457584007913129639936))
