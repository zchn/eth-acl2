
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-expPowerOf256Of256_20 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "60146101000a6101000a600055601460ff0a6101000a60015560146101010a6101000a60025560146101000a60ff0a600355601460ff0a60ff0a60045560146101010a60ff0a60055560146101000a6101010a600655601460ff0a6101010a60075560146101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_20 ()
    (mk-initial-env-expPowerOf256Of256_20))

(defun env-with-post-expPowerOf256Of256_20 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store   (mk-initial-env-expPowerOf256Of256_20)
                               5
                               73186518788354931992268309607910110463491507624599205551010472211597684375807)
                             3
                             11095128516485485949393957618129868380154060907080998068241024442132250755073)
                           7
                           92676439589099754655655035309645792128747303076858301322675459756614409257217)
                         8
                         26768014775117825313334555689265921696132636065691461838850023344632663113985)
                       4
                       46991903036590546434450396132155379898382754470087505882848419300294039175423)
                     6
                     108556343652588169849457393533512576632030094861390478212741088232779389337601) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_20
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_20))
                  (env-with-post-expPowerOf256Of256_20)))