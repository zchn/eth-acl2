
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-modByZero ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "6001600060030603600055")
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

(defun env-with-pre-modByZero ()
    (mk-initial-env-modByZero))

(defun env-with-post-modByZero ()
    (env/set-halted 
  (env/storage/store   (mk-initial-env-modByZero)
                     0
                     115792089237316195423570985008687907853269984665640564039457584007913129639935) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-modByZero
  (expected-env-p (env/exec (env-with-pre-modByZero))
                  (env-with-post-modByZero)))