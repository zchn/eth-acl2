(in-package "ACL2")

(include-book "env")
(include-book "op")
(include-book "op-exec")

(defun env/step (env)
  (if (env/halted env) env
    (if (env/has-nextop env)
        (let ((nextop (env/nextop env)))
          (cond ((op/stopp nextop) (exec-stop env))
                ((op/addp  nextop) (exec-add env))
                ((op/push1p  nextop) (exec-push1 env))
                (t (exec-unknown env))))
      (env/set-halted env "Halted: pc out of range."))))

(defun env/exec (env)
  (if (plusp (env/gas env))
      (let* ((env1 (env/step env))
             (new-env (env/gas-- env1)))
        ;; TODO(zchn): Fix this.
        (env/step
         (env/step
          (env/step
           (env/step
            (env/step
             (env/step
              (env/step
               (env/step new-env)))))))))
    env))

;; (defun env/exec (env)
;;   (if (plusp (env/gas env))
;;       (let* ((env1 (env/step env))
;;              (new-env (env/gas-- env1)))
;;         (env/exec new-env))
;;     env))
