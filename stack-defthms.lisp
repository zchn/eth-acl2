(in-package "ACL2")

(include-book "stack")

(defthm stack/push-io-validp
    (implies (stack/validp s)
             (stack/validp (stack/push s v)))
  :rule-classes nil)

(defthm stack/pop-io-validp
    (implies (stack/validp s)
             (stack/validp (stack/pop s)))
  :rule-classes nil)

(defthm stack/popn-io-validp
    (implies (stack/validp s)
             (stack/validp (stack/popn s n)))
  :rule-classes nil)
