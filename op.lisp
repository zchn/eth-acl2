(in-package "ACL2")

(include-book "stack")

(include-book "env")

(defun run-add (env)
  (if (env/terminated env)
      env
    (let* ((stack (env/stack env))
           (op0 (stack/n stack 0))
           (op1 (stack/n stack 1)))
      (stack/push (stack/popn stack 2) (+ op0 op1)))))
