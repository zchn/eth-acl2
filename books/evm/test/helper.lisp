(in-package "ACL2")

(include-book "../env")
(include-book "../exec")

(defun expected-env-p (actual-env expected-env)
  (and (env/validp actual-env)
       (env/validp expected-env)
       (equal (env/halted actual-env)
              (env/halted expected-env))
       (alist-equiv (env/storage actual-env)
                    (env/storage expected-env))))
