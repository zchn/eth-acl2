(in-package "ACL2")

(include-book "std/strings/top" :dir :system)
(include-book "std/strings/pretty" :dir :system)

(include-book "env")

(defun exec-stop (env)
  (let ((tmp-env (env/set-halted env "Halted: STOP.")))
    (env/pc++ tmp-env)))

(defun exec-add (env)
  (let* ((stack (env/stack env))
         (op0 (stack/n stack 0))
         (op1 (stack/n stack 1))
         (new-stack (stack/push (stack/popn stack 2) (+ op0 op1)))
         (tmp-env (env/set-stack env new-stack))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-div (env)
  (let* ((stack (env/stack env))
         (op0 (stack/n stack 0))
         (op1 (stack/n stack 1))
         (new-stack (stack/push (stack/popn stack 2)
                                (if (zp op1) 0 (truncate op0 op1))))
         (tmp-env (env/set-stack env new-stack))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-exp (env)
  (let* ((stack (env/stack env))
         (op0 (stack/n stack 0))
         (op1 (stack/n stack 1))
         (new-stack (stack/push (stack/popn stack 2) (expt op0 op1)))
         (tmp-env (env/set-stack env new-stack))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-iszero (env)
  (let* ((stack (env/stack env))
         (op0 (stack/n stack 0))
         (new-stack (stack/push (stack/popn stack 1)
                                (if (zp op0) 1 0)))
         (tmp-env (env/set-stack env new-stack))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-calldataload (env)
  (let* ((stack (env/stack env))
         (addr (stack/n stack 0))
         (new-stack (stack/push (stack/popn stack 1)
                                (rom/n-w256 (env/rom env) addr)))
         (tmp-env (env/set-stack env new-stack))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-calldatasize (env)
  (let* ((stack (env/stack env))
         (datasize (rom/datasize (env/rom env)))
         (new-stack (stack/push stack datasize))
         (tmp-env (env/set-stack env new-stack))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-push1 (env)
  (let* ((stack (env/stack env))
         (pc (env/pc env))
         (rom (env/rom env))
         (value-to-push (rom/n-byte rom (+ pc 1)))
         (new-stack (stack/push stack value-to-push))
         (tmp-env (env/set-stack env new-stack))
         (new-env (env/pc+n tmp-env 2)))
    new-env))

(defun exec-push4 (env)
  (let* ((stack (env/stack env))
         (pc (env/pc env))
         (rom (env/rom env))
         (value-to-push (rom/n-w32 rom (+ pc 1)))
         (new-stack (stack/push stack value-to-push))
         (tmp-env (env/set-stack env new-stack))
         (new-env (env/pc+n tmp-env 5)))
    new-env))

(defun exec-mstore (env)
  (let* ((stack (env/stack env))
         (mem-addr (stack/n stack 0))
         (value (stack/n stack 1))
         (mem (env/mem env))
         (new-stack (stack/popn stack 2))
         (new-mem (memory/store mem mem-addr value))
         (tmp-env (env/set-stack env new-stack))
         (tmp2-env (env/set-mem tmp-env new-mem))
         (new-env (env/pc++ tmp2-env)))
    new-env))

(defun exec-jumpi (env)
  (let* ((stack (env/stack env))
         (dest (stack/n stack 0))
         (condition (stack/n stack 1))
         (new-stack (stack/popn stack 2))
         (tmp-env (env/set-stack env new-stack))
         (new-env (if (zp condition)
                      (env/pc++ tmp-env)
                    (env/set-pc env dest))))
    new-env))

(defun exec-unknown (env)
  (let ((tmp-env
         (env/set-halted env (str::cat "Halted: unknown OP:"
                                       (str::pretty (env/nextop env))))))
    (env/pc++ tmp-env)))
