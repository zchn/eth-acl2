
(in-package "ACL2")

(include-book "../env")
(include-book "../exec")
(include-book "helper")

(defun mk-initial-env-expPowerOf256Of256_8 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "60086101000a6101000a600055600860ff0a6101000a60015560086101010a6101000a60025560086101000a60ff0a600355600860ff0a60ff0a60045560086101010a60ff0a60055560086101000a6101010a600655600860ff0a6101010a60075560086101010a6101010a600855")
    ;; stack
    (mk-empty-stack)
    ;; mem
    (mk-empty-memory)
    ;; storage
    (mk-empty-storage)
    ;; halted
    nil
    ;; gas
    10000000
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
        100000000)
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

(defun env-with-pre-expPowerOf256Of256_8 ()
    (mk-initial-env-expPowerOf256Of256_8))

(defun env-with-post-expPowerOf256Of256_8 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store   (mk-initial-env-expPowerOf256Of256_8)
                               8
                               44602545931516731105551475539355266057143712143472076070568941934099028246785)
                             6
                             50966202311329169373084543122261872221808286010888550654989201724462468169729)
                           7
                           5365749204224685697188957744828197388231200721486680577879035665929073066241)
                         4
                         88667181452515305589329844365560673397586036248898611545578811096689003725055)
                       3
                       15831402651885036213026743568650891923074156065744116877715268619479738744833)
                     5
                     46877267689434137414103012444013696658268871052188839792194213401121476051199) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_8
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_8))
                  (env-with-post-expPowerOf256Of256_8)))