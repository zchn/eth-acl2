
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-expPowerOf256Of256_33 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "60216101000a6101000a600055602160ff0a6101000a60015560216101010a6101000a60025560216101000a60ff0a600355602160ff0a60ff0a60045560216101010a60ff0a60055560216101000a6101010a600655602160ff0a6101010a60075560216101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_33 ()
    (mk-initial-env-expPowerOf256Of256_33))

(defun env-with-post-expPowerOf256Of256_33 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store 
              (env/storage/store   (mk-initial-env-expPowerOf256Of256_33)
                                 8
                                 26104390486839708587903636031676095792383620198177622282435444888970572398849)
                               4
                               64135483568242129660189811524440266649397055745562313858450489812292508581631)
                             3
                             1)
                           7
                           104245036966221287026270471239637571306194808795660508680275132968035193847553)
                         5
                         46398695887435477574305959260606258506859266453477299410648234630417678926079)
                       0
                       1)
                     6
                     1) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_33
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_33))
                  (env-with-post-expPowerOf256Of256_33)))