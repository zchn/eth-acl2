(in-package "ACL2")

(include-book "base-defthms")

(include-book "memory")

(defthm memory-empty-validp
    (and (memory/validp nil)
         (memory/validp (mk-empty-memory)))
  :hints (("Goal"
           :in-theory (enable (memory/validp)))))

(defthm memory-load-byte-evm-bytep
    (implies (memory/validp m)
             (evm-bytep (memory/load-byte m addr)))
  :hints (("Goal"
           :in-theory (e/d (memory/validp
                            memory/load-byte)
                           (evm-bytep fix-byte evm-w256p fix-w256)))))

(defthm memory-store-byte-validp
    (implies (memory/validp m)
             (memory/validp (memory/store-byte m addr val)))
  :hints (("Goal"
           :in-theory (e/d (memory/validp memory/store-byte)
                           (evm-bytep fix-byte evm-w256p fix-w256)))))

;; (defthm memory-store-byte-array-validp
;;     (implies (memory/validp m)
;;              (memory/store-byte-array m addr array)))
