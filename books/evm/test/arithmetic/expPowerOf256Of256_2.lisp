
(in-package "ACL2")

(include-book "../env")
(include-book "../exec")
(include-book "helper")

(defun mk-initial-env-expPowerOf256Of256_2 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "60026101000a6101000a600055600260ff0a6101000a60015560026101010a6101000a60025560026101000a60ff0a600355600260ff0a60ff0a60045560026101010a60ff0a60055560026101000a6101010a600655600260ff0a6101010a60075560026101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_2 ()
    (mk-initial-env-expPowerOf256Of256_2))

(defun env-with-post-expPowerOf256Of256_2 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store   (mk-initial-env-expPowerOf256Of256_2)
                               5
                               58705239428236352267206187056125671899556905316536924076733713273217202913535)
                             6
                             46324544842152038903000162237961413134741269428713822661041693336878771601409)
                           8
                           51932325499082483871443854601774097918978859083286306620359033691760211656961)
                         3
                         35684671406788450058690691174653691892701243064536139020904391158652521676801)
                       7
                       106379458411604270640200723872979572934101195248236840362867346110552152604929)
                     4
                     59232513320897970918910043598136467678606867980584390145697722881629753311487) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_2
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_2))
                  (env-with-post-expPowerOf256Of256_2)))