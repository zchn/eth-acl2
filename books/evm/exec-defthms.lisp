(in-package "ACL2")

(local (include-book "std/lists/top" :dir :system))

(include-book "base-defthms")
(include-book "env")
(include-book "env-defthms")
(include-book "exec")
(include-book "memory-defthms")
(include-book "op-exec-defthms")
(include-book "stack-defthms")

(defthm env/step-io-validp
    (implies (env/validp e)
             (env/validp (env/step e)))
  :hints (("Goal" :in-theory (e/d (env/step)
                                  (exec-swap-helper
                                   env/validp
                                   env/set-pc
                                   env/stack/push
                                   env/stack/popn
                                   env/mem/store-byte
                                   env/mem/store-byte-array
                                   env/mem/store-w256
                                   env/storage/store
                                   env/set-halted
                                   env/set-substate
                                   ))
                  :use ((:instance stack/top-evm-w256p
                                   (s (caddr e)))))
          ))


(local (defthm env/exec-hacky-io-validp
           (implies (env/validp e)
                    (env/validp (env/exec-hacky e n)))
         :hints (("Goal"
                  :in-theory (disable env/validp)))))

(defthm env/exec-valid-io
    (implies (env/validp e)
             (env/validp (env/exec e)))
  :hints (("Goal"
           :in-theory (disable env/validp env/exec-hacky))))
