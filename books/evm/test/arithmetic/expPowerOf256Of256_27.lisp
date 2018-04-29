
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-expPowerOf256Of256_27 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "601b6101000a6101000a600055601b60ff0a6101000a600155601b6101010a6101000a600255601b6101000a60ff0a600355601b60ff0a60ff0a600455601b6101010a60ff0a600555601b6101000a6101010a600655601b60ff0a6101010a600755601b6101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_27 ()
    (mk-initial-env-expPowerOf256Of256_27))

(defun env-with-post-expPowerOf256Of256_27 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store   (mk-initial-env-expPowerOf256Of256_27)
                               4
                               10645426101861250165015700741141466012883289588076566266701569922896236248831)
                             8
                             12350951291019601932674792934478196555907435661086930635755345915574960718081)
                           3
                           38483692440104869020221269351636561967706069858656226019112854607988829192193)
                         7
                         94151869200341398878616437045666795696078883504233219193427246506933705506561)
                       6
                       77082233471173346418599266142200390038512544417075286623318608643634621317121)
                     5
                     25748258427330701187106324113792620342456959469328998556434781418740772438271) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_27
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_27))
                  (env-with-post-expPowerOf256Of256_27)))