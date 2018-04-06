(in-package "ACL2")

(include-book "context")

(defthm mk-dummy-context-validp
  (context/validp (mk-dummy-context)))
