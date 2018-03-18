(include-book "contracts")
(include-book "env")
(include-book "exec")
(include-book "exec-defthms")

(env/exec (mk-env-op *simple-storage-contract*))

(env/exec (mk-env-op *deed-contract*))

(env/exec (mk-env-op "6002600301600901"))

(env/exec (mk-env-op *simple-storage-create*))
(env/exec (mk-env-op *simple-storage-contract*))
