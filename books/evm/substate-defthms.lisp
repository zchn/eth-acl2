(in-package "ACL2")

(include-book "substate")

(defthm mk-empty-substate-validp
  (substate/validp (mk-empty-substate)))
