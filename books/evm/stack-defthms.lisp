(in-package "ACL2")

(include-book "stack")

(defthm stack/empty-validp
  (stack/validp (list 'stack-bottom)))

(defthm stack/push-io-validp
    (implies (stack/validp s)
             (stack/validp (stack/push s v)))
  :hints (("Goal"
           :in-theory (enable stack/push stack/validp stack/top stack/pop mk-empty-stack))))

(defthm stack/pop-io-validp
    (implies (stack/validp s)
             (stack/validp (stack/pop s)))
  :hints (("Goal"
           :in-theory (enable stack/validp stack/pop))))

(defthm stack/popn-io-validp
    (implies (stack/validp s)
             (stack/validp (stack/popn s n)))
  :hints (("Goal"
           :in-theory (enable stack/validp))))

(defthm stack/validp-implies-consp
    (implies (stack/validp s)
             (consp s))
  :hints (("Goal"
           :in-theory (enable stack/validp))))

(defthm stack/push-then-pop-unchanged
    (implies (evm-w256p n)
             (equal (stack/pop (stack/push stack n))
                    stack))
  :hints (("Goal"
           :in-theory (enable stack/push stack/pop))))

(defthm stack/top-evm-w256p
    (implies (stack/validp s)
             (evm-w256p (stack/top s)))
  :hints (("Goal"
           :in-theory (enable stack/validp stack/top))))
