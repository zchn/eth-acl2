
(in-package "ACL2")

(include-book "../env")
(include-book "../exec")
(include-book "helper")

(defun mk-initial-env-expPowerOf256Of256_29 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "601d6101000a6101000a600055601d60ff0a6101000a600155601d6101010a6101000a600255601d6101000a60ff0a600355601d60ff0a60ff0a600455601d6101010a60ff0a600555601d6101000a6101010a600655601d60ff0a6101010a600755601d6101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_29 ()
    (mk-initial-env-expPowerOf256Of256_29))

(defun env-with-post-expPowerOf256Of256_29 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store   (mk-initial-env-expPowerOf256Of256_29)
                               5
                               76104085449040805828347092808887448743067930323369183960769396019351951048959)
                             7
                             8209822676187988811602632091276622081528672854534573424947815086289865015041)
                           6
                           115567699660089340613713906226093557201759894210737360431776140020348966928385)
                         3
                         115564165965959783845054739631092071364728239242943609193859896807946381688833)
                       4
                       29796811703898097440410573382566381985909385283921616312244836775545701924607)
                     8
                     41969510495593925548691353067322800651185377980400075429162359216161003733249) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_29
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_29))
                  (env-with-post-expPowerOf256Of256_29)))