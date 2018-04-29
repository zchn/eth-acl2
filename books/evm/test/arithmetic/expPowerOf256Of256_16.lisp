
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-expPowerOf256Of256_16 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "60106101000a6101000a600055601060ff0a6101000a60015560106101010a6101000a60025560106101000a60ff0a600355601060ff0a60ff0a60045560106101010a60ff0a60055560106101000a6101010a600655601060ff0a6101010a60075560106101010a6101010a600855")
    ;; stack
    (mk-empty-stack)
    ;; mem
    (mk-empty-memory)
    ;; storage
    (mk-empty-storage)
    ;; halted
    nil
    ;; gas
    1000000
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
        10000000)
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

(defun env-with-pre-expPowerOf256Of256_16 ()
    (mk-initial-env-expPowerOf256Of256_16))

(defun env-with-post-expPowerOf256Of256_16 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store   (mk-initial-env-expPowerOf256Of256_16)
                               7
                               61912347378855182565924718380527615965311347792179366367697517640802114732289)
                             6
                             15632688003335927851000079576175125536432017372200003824721518905389570064385)
                           5
                           48021548981484736825763261181421514354558065935321217017669311494625227178239)
                         8
                         33499807378575975745280476771049124131850159969595906991504434239871965462785)
                       4
                       22225091498890937679096212997872924330088689197184547205512400761506168307967)
                     3
                     59218374413855094843010372350483534772436796474263353446173791691863603806209) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_16
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_16))
                  (env-with-post-expPowerOf256Of256_16)))