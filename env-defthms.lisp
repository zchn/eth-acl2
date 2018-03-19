(in-package "ACL2")

(include-book "stack-defthms")

(defthm mk-env-op-validp
    (env/validp (mk-env-op anything)))

(defthm env/setsubstate-io-validp
    (implies (and (env/validp e)
                  (substate/validp ss))
             (env/validp (env/set-substate e ss))))
