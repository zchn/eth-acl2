
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-expPowerOf256Of256_15 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "600f6101000a6101000a600055600f60ff0a6101000a600155600f6101010a6101000a600255600f6101000a60ff0a600355600f60ff0a60ff0a600455600f6101010a60ff0a600555600f6101000a6101010a600655600f60ff0a6101010a600755600f6101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_15 ()
    (mk-initial-env-expPowerOf256Of256_15))

(defun env-with-post-expPowerOf256Of256_15 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store   (mk-initial-env-expPowerOf256Of256_15)
                               8
                               104349806891036036967003847033901513956038759123355017779183952015787964694785)
                             6
                             86452819266916911147472883657170177834027340189490420841254375251628114575361)
                           3
                           68982874759710612496975781615902521595583884631451676122827056878494762926081)
                         7
                         89845175342602369207035384471933876015521364174370333412283388556428862029569)
                       5
                       41822178356738160566095801792837818951900117455658262420410104537286555140351)
                     4
                     53267908598997767238534137623343245537541072806296987245216780723497328312063) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_15
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_15))
                  (env-with-post-expPowerOf256Of256_15)))