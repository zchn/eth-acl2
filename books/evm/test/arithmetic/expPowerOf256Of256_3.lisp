
(in-package "ACL2")

(include-book "../env")
(include-book "../exec")
(include-book "helper")

(defun mk-initial-env-expPowerOf256Of256_3 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "60036101000a6101000a600055600360ff0a6101000a60015560036101010a6101000a60025560036101000a60ff0a600355600360ff0a60ff0a60045560036101010a60ff0a60055560036101000a6101010a600655600360ff0a6101010a60075560036101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_3 ()
    (mk-initial-env-expPowerOf256Of256_3))

(defun env-with-post-expPowerOf256Of256_3 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store   (mk-initial-env-expPowerOf256Of256_3)
                               7
                               30399330551861971515974303894253779338600539720187268158424855738354206244609)
                             5
                             42129814684646543126348356257504972372034277499141030862086683680913974558975)
                           8
                           108980024387197914276205543464773254377859711155926716677281663773064325955841)
                         3
                         7509106097093730011630093237202784650072841651671912529772991585339238776833)
                       4
                       38290356903089152037544434592592465510243346109437057546044682301961169665791)
                     6
                     18796044789528149052406582351866041199292954077820157477205660679666629869569) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_3
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_3))
                  (env-with-post-expPowerOf256Of256_3)))