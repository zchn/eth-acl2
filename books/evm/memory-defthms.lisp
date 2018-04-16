(in-package "ACL2")

(include-book "memory")

(defthm memory-empty-validp
    (and (memory/validp nil)
         (memory/validp (mk-empty-memory)))
  :hints (("Goal"
           :in-theory (enable memory/validp))))

(defthm memory-load-byte-evm-bytep
    (implies (memory/validp m)
             (evm-bytep (memory/load-byte m addr)))
  :hints (("Goal"
           :in-theory (enable memory/validp
                              memory/load-byte))))
