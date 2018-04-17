(ubt 1)

(include-book "std/lists/top" :dir :system)

(include-book "env")
(include-book "env-defthms")
(include-book "exec")
(include-book "memory-defthms")
(include-book "op-exec-defthms")

(defthm env/step-io-validp
    (implies (env/validp e)
             (env/validp (env/step e)))
  :hints (("Goal" :in-theory (enable env/step))))


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
