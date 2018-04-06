(in-package "ACL2")

(include-book "std/lists/top" :dir :system)

(include-book "env")
(include-book "env-defthms")
(include-book "exec")
(include-book "op-exec-defthms")

(defthm env/step-io-pc-validp
    (implies (env/validp e)
             (integerp (env/pc (env/step e)))))

;; The proof checking takes about 10 minutes.
(defthm env/step-io-validp
    (implies (env/validp e)
             (env/validp (env/step e))))

;; The proof checking takes 12000+ seconds.
;; (defthm env/exec-hacky-io-pc-validp
;;     (implies (env/validp e)
;;              (integerp (env/pc (env/exec-hacky e n))))
;;   :hints (("Goal" :in-theory (disable stack/pop
;;                                       stack/push))))

;; (defthm env/exec-hacky-io-validp
;;     (implies (env/validp e)
;;              (env/validp (env/exec-hacky e n)))
;;   :hints (("Goal" :in-theory (disable stack/pop
;;                                       stack/push))))

;; (defthm env/exec-valid-io
;;     (implies (env/validp e)
;;              (env/validp (env/exec e))))
