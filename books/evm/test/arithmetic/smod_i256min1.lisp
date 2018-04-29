
(in-package "ACL2")

(include-book "../env")
(include-book "../exec")
(include-book "helper")

(defun mk-initial-env-smod_i256min1 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "60016000037f800000000000000000000000000000000000000000000000000000000000000060000307600055")
    ;; stack
    (mk-empty-stack)
    ;; mem
    (mk-empty-memory)
    ;; storage
    (mk-empty-storage)
    ;; halted
    nil
    ;; gas
    100000
    ;; context
  
    (mk-context
      ;; ia
      87579061662017136990230301793909925042452127430
      ;; io
      1170859069521887415590932569929099639409724315265
      ;; ip
      100000000000000
      ;; id
      nil
      ;; is
      1170859069521887415590932569929099639409724315265
      ;; iv
      1000000000000000000
      ;; ih
  
      (mk-block-header
        ;; ihc
        244687034288125203496486448490407391986876152250
        ;; ihs
        1
        ;; ihi
        0
        ;; ihd
        256
        ;; ihl
        1000000)
      ;; ie
       "<call/create stack height>"
      ;; iw
      "<permission>")
    ;; substate
  
    (mk-substate
      ;; suiside
      nil
      ;; log
      nil
      ;; touched
      nil
      ;; refund
      0)))

(defun env-with-pre-smod_i256min1 ()
    (mk-initial-env-smod_i256min1))

(defun env-with-post-smod_i256min1 ()
    (env/set-halted (mk-initial-env-smod_i256min1) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-smod_i256min1
  (expected-env-p (env/exec (env-with-pre-smod_i256min1))
                  (env-with-post-smod_i256min1)))