(in-package "ACL2")

(include-book "context-defthms")
(include-book "env")
(include-book "memory-defthms")
(include-book "stack-defthms")
(include-book "substate-defthms")

(defthm mk-env-op-validp
    (env/validp (mk-env-op anything)))

(defthm env/set-pc-validp
    (implies (env/validp e)
             (env/validp (env/set-pc e n))))

(defthm env/stack/popn-validp
    (implies (env/validp e)
             (env/validp (env/stack/popn e n))))

(defthm env/stack/push-validp
    (implies (env/validp e)
             (env/validp (env/stack/push e v))))

(defthm env/memory/store-byte-validp
    (implies (env/validp e)
             (env/validp (env/mem/store-byte e addr v)))
  :hints (("Goal"
           :in-theory (e/d () (memory/validp memory/store-byte))
           :use ((:instance memory-store-byte-validp
                            (m (nth 2 (cdr e))))))))

(defthm env/memory/store-byte-array-validp
    (implies (env/validp e)
             (env/validp (env/mem/store-byte-array e addr v))))

(defthm env/memory/store-w256-validp
    (implies (env/validp e)
             (env/validp (env/mem/store-w256 e addr v))))

(defthm env/storage/store-validp
    (implies (env/validp e)
             (env/validp (env/storage/store e offset v))))

(defthm env/set-halted-validp
    (implies (and (env/validp e)
                  (halted/validp h))
             (env/validp (env/set-halted e h))))

(defthm env/setsubstate-io-validp
    (implies (and (env/validp e)
                  (substate/validp ss))
             (env/validp (env/set-substate e ss))))
