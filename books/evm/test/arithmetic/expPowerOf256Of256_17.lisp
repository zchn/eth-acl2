
(in-package "ACL2")

(include-book "../env")
(include-book "../exec")
(include-book "helper")

(defun mk-initial-env-expPowerOf256Of256_17 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "60116101000a6101000a600055601160ff0a6101000a60015560116101010a6101000a60025560116101000a60ff0a600355601160ff0a60ff0a60045560116101010a60ff0a60055560116101000a6101010a600655601160ff0a6101010a60075560116101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_17 ()
    (mk-initial-env-expPowerOf256Of256_17))

(defun env-with-post-expPowerOf256Of256_17 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store   (mk-initial-env-expPowerOf256Of256_17)
                               3
                               106932249095798874746427270594356880818721890878145157091004752088375721197569)
                             6
                             65037094785246885454606881205443270315416968651421801787150983510683528724481)
                           8
                           70752790625743581923020113660624109695844588519198843885497132740742925582593)
                         5
                         62775564944078456192298461614676049908347327243429853520972071233715122012415)
                       7
                       58726458517348185850456409500813811723249871888157665424521042251051315625729)
                     4
                     51639322353743519847823032836772280028397740691078922235532368225465122422527) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_17
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_17))
                  (env-with-post-expPowerOf256Of256_17)))