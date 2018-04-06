(in-package "ACL2")

(include-book "std/lists/top" :dir :system)

(include-book "env")
(include-book "env-defthms")
(include-book "op-exec")

(defthm exec-stop-io-validp
    (implies (env/validp e)
             (env/validp (exec-stop e))))

(defthm exec-revert-io-validp
    (implies (env/validp e)
             (env/validp (exec-revert e))))

(defthm exec-calldataload-io-validp
    (implies (env/validp e)
             (env/validp (exec-calldataload e))))
