
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-expPowerOf256_23 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "60176101000a600055601760ff0a60015560176101010a600255")
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

(defun env-with-pre-expPowerOf256_23 ()
    (mk-initial-env-expPowerOf256_23))

(defun env-with-post-expPowerOf256_23 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store   (mk-initial-env-expPowerOf256_23)
                         2
                         26820189163684151285035147401442659727467946863138510593)
                       1
                       22409086343932890693549885316479244931352138519287109375)
                     0
                     24519928653854221733733552434404946937899825954937634816) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256_23
  (expected-env-p (env/exec (env-with-pre-expPowerOf256_23))
                  (env-with-post-expPowerOf256_23)))