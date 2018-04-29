
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-expPowerOf256Of256_18 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "60126101000a6101000a600055601260ff0a6101000a60015560126101010a6101000a60025560126101000a60ff0a600355601260ff0a60ff0a60045560126101010a60ff0a60055560126101000a6101010a600655601260ff0a6101010a60075560126101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_18 ()
    (mk-initial-env-expPowerOf256Of256_18))

(defun env-with-post-expPowerOf256Of256_18 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store   (mk-initial-env-expPowerOf256Of256_18)
                               3
                               47722708517889815122628810105015236221087683713987101985226708756686031552513)
                             6
                             91227504086986730808710732351106377729136167577380599868217265603405814956033)
                           7
                           29421361713313315972990398225990402447830660289868159244224680982816723173633)
                         5
                         87617296414069687466701422777716467712815533019690209856230187888840918827263)
                       8
                       110931130223540473897795733757531375082108475243595043250924744061846069313793)
                     4
                     62498223098821962733903061319732317376595162521044937752089040386950014304511) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_18
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_18))
                  (env-with-post-expPowerOf256Of256_18)))