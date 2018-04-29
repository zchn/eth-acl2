
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-expPowerOf256_21 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "60156101000a600055601560ff0a60015560156101010a600255")
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

(defun env-with-pre-expPowerOf256_21 ()
    (mk-initial-env-expPowerOf256_21))

(defun env-with-post-expPowerOf256_21 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store   (mk-initial-env-expPowerOf256_21)
                         2
                         406065029957821485337176148033167189926689985664257)
                       0
                       374144419156711147060143317175368453031918731001856)
                     1
                     344622627357676135233370016401064897060394287109375) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256_21
  (expected-env-p (env/exec (env-with-pre-expPowerOf256_21))
                  (env-with-post-expPowerOf256_21)))