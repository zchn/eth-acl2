
(in-package "ACL2")

(include-book "../env")
(include-book "../exec")
(include-book "helper")

(defun mk-initial-env-expPowerOf256Of256_9 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "60096101000a6101000a600055600960ff0a6101000a60015560096101010a6101000a60025560096101000a60ff0a600355600960ff0a60ff0a60045560096101010a60ff0a60055560096101000a6101010a600655600960ff0a6101010a60075560096101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_9 ()
    (mk-initial-env-expPowerOf256Of256_9))

(defun env-with-post-expPowerOf256Of256_9 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store   (mk-initial-env-expPowerOf256Of256_9)
                               5
                               20900127223701187507569604367284576078235625433031513598122327338511564865791)
                             7
                             110152184046086891254004814608804722935320045522148244199157782070981523275521)
                           8
                           37242642928182852816882152052488410953256925480179486681539560659802290454785)
                         3
                         37544599844834186309489558325272750245245031648093458553266128448984962826241)
                       4
                       32902293083653969256382290890943213921228732500552563030700054273598132059903)
                     6
                     556072892769477086587558712025699215307595196328648543389280473869891665921) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_9
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_9))
                  (env-with-post-expPowerOf256Of256_9)))