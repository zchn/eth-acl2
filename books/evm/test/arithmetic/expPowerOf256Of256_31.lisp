
(in-package "ACL2")

(include-book "../env")
(include-book "../exec")
(include-book "helper")

(defun mk-initial-env-expPowerOf256Of256_31 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "601f6101000a6101000a600055601f60ff0a6101000a600155601f6101010a6101000a600255601f6101000a60ff0a600355601f60ff0a60ff0a600455601f6101010a60ff0a600555601f6101000a6101010a600655601f60ff0a6101010a600755601f6101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_31 ()
    (mk-initial-env-expPowerOf256Of256_31))

(defun env-with-post-expPowerOf256Of256_31 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store   (mk-initial-env-expPowerOf256Of256_31)
                               8
                               81761461417135675039681145207874119897008583353196969206846550448999168409857)
                             5
                             62075428888398948475210828438627792272695349249636165883831517298362121388287)
                           6
                           1)
                         7
                         107818586060941895166288682821279836433776680519631913166930934049164849315585)
                       4
                       112985507611037855861351294922934055679136269367323143362415325409413936578303)
                     3
                     1) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_31
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_31))
                  (env-with-post-expPowerOf256Of256_31)))