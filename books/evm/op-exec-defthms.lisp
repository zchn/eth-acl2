(in-package "ACL2")

(local (include-book "std/lists/top" :dir :system))

(include-book "env")
(include-book "env-defthms")
(include-book "op-exec")

(defthm op-unchanged-in-exec-swap-swapper
    (equal (car (exec-swap-swapper e n))
           (car e)))

(defthm exec-swap-swapper-validp
    (implies (env/validp e)
             (env/validp (exec-swap-swapper e n))))

(defthm exec-swap-helper-validp
    (implies (env/validp e)
             (env/validp (exec-swap-helper e n)))
  :hints (("Goal"
           :in-theory (e/d () (env/validp exec-swap-swapper env/set-pc)))))

(defthm exec-stop-io-validp
    (implies (env/validp e)
             (env/validp (exec-stop e))))

(defthm exec-revert-io-validp
    (implies (env/validp e)
             (env/validp (exec-revert e))))

(defthm exec-calldataload-io-validp
    (implies (env/validp e)
             (env/validp (exec-calldataload e))))
