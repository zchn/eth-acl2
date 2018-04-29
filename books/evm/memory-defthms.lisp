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
                           ()))))

(defthm memory-load-byte-array-evm-byte-arrayp
    (implies (memory/validp m)
             (evm-byte-arrayp (memory/load-byte-array m addr c))))

;; TODO(zchn): Prove the following defthm.
;; (defthm memory-load-w256-evm-w256p
;;     (implies (memory/validp m)
;;              (evm-w256p (memory/load-w256 m addr))))

(defthm memory-store-byte-validp
    (implies (memory/validp m)
             (memory/validp (memory/store-byte m addr val))))

(defthm memory-store-byte-array-validp
    (implies (memory/validp m)
             (memory/validp (memory/store-byte-array m addr array))))

(defthm memory-store-w256-validp
    (implies (memory/validp m)
             (memory/validp (memory/store-w256 m addr v))))
