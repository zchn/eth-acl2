
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-expPowerOf256_28 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "601c6101000a600055601c60ff0a600155601c6101010a600255")
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

(defun env-with-pre-expPowerOf256_28 ()
    (mk-initial-env-expPowerOf256_28))

(defun env-with-post-expPowerOf256_28 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store   (mk-initial-env-expPowerOf256_28)
                         1
                         24161564501550368558430041444810830996032029256261885166168212890625)
                       0
                       26959946667150639794667015087019630673637144422540572481103610249216)
                     2
                     30069586313578814902099389809350676614266966730737415459273176652801) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256_28
  (expected-env-p (env/exec (env-with-pre-expPowerOf256_28))
                  (env-with-post-expPowerOf256_28)))