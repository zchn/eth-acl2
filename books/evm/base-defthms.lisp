(in-package "ACL2")

(include-book "base")

(include-book "arithmetic/top" :dir :system)
(include-book "ihs/quotient-remainder-lemmas" :dir :system)

(defthm evm-bytep-fix-byte
    (evm-bytep (fix-byte n)))

(defthm evm-w256p-fix-w256
    (evm-w256p (fix-w256 n)))
