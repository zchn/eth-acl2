(include-book "exec")
(include-book "env")
(include-book "contracts")

(env/exec (mk-env-op *simple-adder-contract*))

(env/exec (mk-env-op *deed-contract*))

(env/exec (mk-env-op "6002600301600901"))

(env/exec (mk-env-op *simple-storage-create*))
(env/exec (mk-env-op *simple-storage-contract*))
