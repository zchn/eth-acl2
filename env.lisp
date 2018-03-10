(in-package "ACL2")

(include-book "memory")
(include-book "rom")
(include-book "stack")
(include-book "storage")

(defun mk-env (pc rom stack mem storage halted gas)
  (list pc rom stack mem storage halted gas))

(defun mk-env-op (opstring)
  (mk-env 0
          (mk-rom opstring)
          (mk-empty-stack)
          (mk-empty-memory)
          (mk-empty-storage)
          nil
          10000))

(defun env/pc (env) (car env))

(defun env/pc++ (env) (list* (1+ (env/pc env)) (cdr env)))

(defun env/rom (env) (cdar env))

(defun env/stack (env) (cddar env))

(defun env/mem (env) (cdddar env))

(defun env/storage (env) (cddar (cddr env)))

(defun env/halted (env) (cddar (cddr (cdr env))))

(defun env/gas (env) (cddar (cddr (cddr env))))

(defun env/nextop (env) (let* ((pc (env/pc env))
                               (rom (env/rom env)))
                          (rom/n rom pc)))
