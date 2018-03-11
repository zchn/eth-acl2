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

(defun env/pc (env) (nth 0 env))

(defun env/pc+n (env n) (update-nth 0 (+ n (env/pc env)) env))

(defun env/pc++ (env) (env/pc+n env 1))

(defun env/rom (env) (nth 1 env))

(defun env/stack (env) (nth 2 env))

(defun env/set-stack (env stack) (update-nth 2 stack env))

(defun env/mem (env) (nth 3 env))

(defun env/storage (env) (nth 4 env))

(defun env/halted (env) (nth 5 env))

(defun env/set-halted (env halted) (update-nth 5 halted env))

(defun env/gas (env) (nth 6 env))

(defun env/gas-- (env) (update-nth 6 (1- (env/gas env)) env))

(defun env/nextop (env) (let* ((pc (env/pc env))
                               (rom (env/rom env)))
                          (rom/n-op rom pc)))
