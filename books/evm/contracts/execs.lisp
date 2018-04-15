(in-package "ACL2")

(include-book "../contracts")
(include-book "../env")
(include-book "../exec")

(defthm execs-1 (env/validp (env/exec (mk-env-op *simple-storage-contract*))))

(defthm execs-2 (env/validp (env/exec (mk-env-op *deed-contract*))))

(defthm execs-3 (env/validp (env/exec (mk-env-op "6002600301600901"))))

(defthm execs-4 (env/validp (env/exec (mk-env-op *simple-storage-create*))))

(defthm execs-5 (env/validp (env/exec (mk-env-op *simple-storage-contract*))))
