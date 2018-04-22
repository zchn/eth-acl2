(in-package "ACL2")

(include-book "base-defthms")

(include-book "memory")

(defthm memory-empty-validp
    (and (memory/validp nil)
         (memory/validp (mk-empty-memory))))

(defthm memory-load-byte-evm-bytep
    (implies (memory/validp m)
             (evm-bytep (memory/load-byte m addr)))
  :hints (("Goal"
           :in-theory (e/d (memory/load-byte)
                           (evm-bytep fix-byte evm-w256p fix-w256)))))

(defthm memory-cons-validp-equal
    (implies (and (evm-bytep v)
                  (< (len (double-rewrite m)) 115792089237316195423570985008687907853269984665640564039457584007913129639936))
             (equal (memory/validp (cons v m))
                    (memory/validp m)))
  :hints (("Goal"
           :in-theory (e/d (memory/store-byte memory/validp evm-bytep fix-byte evm-w256p fix-w256)
                           ()))))

(defthm memory-validp-len-m
    (implies (memory/validp m)
             (<= (len m) 115792089237316195423570985008687907853269984665640564039457584007913129639936))
  :hints (("Goal"
           :in-theory (e/d (memory/store-byte memory/validp evm-bytep fix-byte evm-w256p fix-w256)
                           ()))))

(defthm memory-validp-true-listp-m
    (implies (memory/validp m)
             (true-listp m))
  :hints (("Goal"
           :in-theory (e/d (memory/validp evm-bytep fix-byte evm-w256p fix-w256)
                           ()))))

(defthm memory-store-byte-validp
    (implies (memory/validp m)
             (memory/validp (memory/store-byte m addr val)))
  :hints (("Goal"
           :in-theory (e/d (memory/store-byte evm-bytep evm-w256p fix-byte fix-w256)
                           (memory/validp)))))

;; (defthm memory-store-byte-array-validp
;;     (implies (memory/validp m)
;;              (memory/store-byte-array m addr array)))
