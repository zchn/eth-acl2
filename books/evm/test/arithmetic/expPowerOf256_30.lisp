
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-expPowerOf256_30 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "601e6101000a600055601e60ff0a600155601e6101010a600255")
    ;; stack
    (mk-empty-stack)
    ;; mem
    (mk-empty-memory)
    ;; storage
    (mk-empty-storage)
    ;; halted
    nil
    ;; gas
    100000
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
        1000000)
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

(defun env-with-pre-expPowerOf256_30 ()
    (mk-initial-env-expPowerOf256_30))

(defun env-with-post-expPowerOf256_30 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store   (mk-initial-env-expPowerOf256_30)
                         0
                         1766847064778384329583297500742918515827483896875618958121606201292619776)
                       1
                       1571105731713312715511913444948824285516982702388429082930088043212890625)
                     2
                     1986066106425567145468762597517802839695718885598475553669534044740853249) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256_30
  (expected-env-p (env/exec (env-with-pre-expPowerOf256_30))
                  (env-with-post-expPowerOf256_30)))