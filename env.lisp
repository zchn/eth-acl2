(in-package "ACL2")

(include-book "context")
(include-book "memory")
(include-book "rom")
(include-book "stack")
(include-book "storage")
(include-book "substate")

(defun mk-env (pc rom stack mem storage halted gas context substate)
  (list pc rom stack mem storage halted gas context substate))

(defun mk-env-op (opstring)
  (mk-env 0
          (mk-rom opstring)
          (mk-empty-stack)
          (mk-empty-memory)
          (mk-empty-storage)
          nil
          100
          (mk-dummy-context)
          (mk-empty-substate)))

(defun env/pc (env) (nth 0 env))

(defun env/set-pc (env pc) (update-nth 0 pc env))

(defun env/pc+n (env n) (env/set-pc env (+ n (env/pc env))))

(defun env/pc++ (env) (env/pc+n env 1))

(defun env/rom (env) (nth 1 env))

(defun env/rom/n-byte-array (env n)
  (rom/n-byte-array (env/rom env) n))

(defun env/stack (env) (nth 2 env))

(defun env/set-stack (env stack) (update-nth 2 stack env))

(defun env/mem (env) (nth 3 env))

(defun env/mem/load-byte-array (env mem-start mem-len)
  (memory/load-byte-array (env/mem env) mem-start mem-len))

(defun env/set-mem (env memory) (update-nth 3 memory env))

(defun env/mem/store-byte-array (env addr array)
  (env/set-mem env
               (memory/store-byte-array (env/mem env) addr array)))

(defun env/storage (env) (nth 4 env))

(defun env/halted (env) (nth 5 env))

(defun env/set-halted (env halted) (update-nth 5 halted env))

(defun env/gas (env) (nth 6 env))

(defun env/gas-- (env) (update-nth 6 (1- (env/gas env)) env))

(defun env/context (env) (nth 7 env))

(defun env/context/Is (env) (context/Is (env/context env)))

(defun env/context/Iv (env) (context/Iv (env/context env)))

(defun env/set-context (env context) (update-nth 7 context env))

(defun env/substate (env) (nth 8 env))

(defun env/set-substate (env substate) (update-nth 7 substate env))

(defun env/has-nextop (env)
  (let* ((pc (env/pc env))
         (rom (env/rom env)))
    (rom/has-n rom pc)))

(defun env/nextop (env) (let* ((pc (env/pc env))
                               (rom (env/rom env)))
                          (rom/n-op rom pc)))
