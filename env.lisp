(in-package "ACL2")

(defun mk-env (stack mem terminated)
  (list stack mem terminated))

(defun env/stack (env) (car env))

(defun env/mem (env) (cdar env))

(defun env/terminated (env) (cddar env))
