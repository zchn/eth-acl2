
(in-package "ACL2")

(include-book "../env")
(include-book "../exec")
(include-book "helper")

(defun mk-initial-env-expPowerOf256Of256_25 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "60196101000a6101000a600055601960ff0a6101000a60015560196101010a6101000a60025560196101000a60ff0a600355601960ff0a60ff0a60045560196101010a60ff0a60055560196101000a6101010a600655601960ff0a6101010a60075560196101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_25 ()
    (mk-initial-env-expPowerOf256Of256_25))

(defun env-with-post-expPowerOf256Of256_25 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store   (mk-initial-env-expPowerOf256Of256_25)
                               3
                               23082677268810102567787957297101600109208477565640060193443191380828630286337)
                             6
                             15363911409789054756994145414988457629001175372500027154689132866782353162241)
                           4
                           57586941904103598579764390844964981043049052155114937185797634212581688737535)
                         5
                         8349948914438381240675947491016368716939310261807744693247618018857855811839)
                       8
                       18926565843436435145785316737060988839741893259630947091482933154404627972353)
                     7
                     46259949032879378200402632411429142790698144536296724901325017870796521602817) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_25
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_25))
                  (env-with-post-expPowerOf256Of256_25)))