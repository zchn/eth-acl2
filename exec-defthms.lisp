(in-package "ACL2")

(include-book "env")
(include-book "exec")

;; (defthm env/exec-hacky-valid-io-pc-limit-step
;;     (implies (env/validp e)
;;              (natp (env/pc (env/exec-hacky e 10)))))

;; (defthm env/exec-hacky-valid-io-pc
;;     (implies (env/validp e)
;;              (natp (env/pc (env/exec-hacky e n)))))

;; (defthm env/exec-hacky-valid-io
;;     (implies (env/validp e)
;;              (env/validp (env/exec-hacky e n))))

;; (defthm env/exec-valid-io
;;     (implies (env/validp e)
;;              (env/validp (env/exec e))))
