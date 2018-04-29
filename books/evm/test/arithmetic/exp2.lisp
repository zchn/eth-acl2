
(in-package "ACL2")

(include-book "../env")
(include-book "../exec")
(include-book "helper")

(defun mk-initial-env-exp2 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "637fffffff637fffffff0a600055")
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

(defun env-with-pre-exp2 ()
    (mk-initial-env-exp2))

(defun env-with-post-exp2 ()
    (env/set-halted 
  (env/storage/store   (mk-initial-env-exp2)
                     0
                     85283587600373122322928310453130164142775440871555374690023406742016433848319) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-exp2
  (expected-env-p (env/exec (env-with-pre-exp2))
                  (env-with-post-exp2)))