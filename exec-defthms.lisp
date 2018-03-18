(in-package "ACL2")

(include-book "env")
(include-book "env-defthms")
(include-book "exec")

;; (defthm env/exec-step-valid-io-pc
;;     (implies (env/validp e)
;;              (integerp (env/pc (env/step e)))))

;; (defthm env/exec-hacky-valid-io-pc-limit-step
;;     (implies (env/validp e)
;;              (integerp (env/pc (env/exec-hacky e 1)))))

;; (defthm env/exec-hacky-valid-io-pc
;;     (implies (env/validp e)
;;              (integerp (env/pc (env/exec-hacky e n)))))

;; (defthm env/exec-hacky-valid-io
;;     (implies (env/validp e)
;;              (env/validp (env/exec-hacky e n))))

;; (defthm env/exec-valid-io
;;     (implies (env/validp e)
;;              (env/validp (env/exec e))))
