(in-package "ACL2")

(include-book "env")
(include-book "op")
(include-book "op-exec")

(defun env/step (env)
  (if (env/halted env) env
    (let ((nextop (env/nextop env)))
      (cond ((op/stopp nextop) (exec-stop env))
            ((op/addp  nextop) (exec-add env))
            (t (exec-unknown env))))))

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
