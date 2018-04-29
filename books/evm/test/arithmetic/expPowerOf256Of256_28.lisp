
(in-package "ACL2")

(include-book "../env")
(include-book "../exec")
(include-book "helper")

(defun mk-initial-env-expPowerOf256Of256_28 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "601c6101000a6101000a600055601c60ff0a6101000a600155601c6101010a6101000a600255601c6101000a60ff0a600355601c60ff0a60ff0a600455601c6101010a60ff0a600555601c6101000a6101010a600655601c60ff0a6101010a600755601c6101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_28 ()
    (mk-initial-env-expPowerOf256Of256_28))

(defun env-with-post-expPowerOf256Of256_28 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store   (mk-initial-env-expPowerOf256Of256_28)
                               8
                               16396339996675966641824655691596686069377228532714487479381181772823590076673)
                             6
                             48396598276623461154344680926355514803313977612377488861774531425231018393601)
                           5
                           4299935168788447616930174254794111967803711819433703141028002505899609161983)
                         4
                         115713305055813628029830397870082340621250109295361800782843501472376682709247)
                       7
                       11701876412405919828967277792221997215490266144933920662620311123106761801985)
                     3
                     9497679494969858173111228280487696204805187236545917538996138972524253806593) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_28
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_28))
                  (env-with-post-expPowerOf256Of256_28)))