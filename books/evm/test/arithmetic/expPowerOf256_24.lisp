
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-expPowerOf256_24 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "60186101000a600055601860ff0a60015560186101010a600255")
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

(defun env-with-pre-expPowerOf256_24 ()
    (mk-initial-env-expPowerOf256_24))

(defun env-with-post-expPowerOf256_24 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store   (mk-initial-env-expPowerOf256_24)
                         0
                         6277101735386680763835789423207666416102355444464034512896)
                       2
                       6892788615066826880254032882170763549959262343826597222401)
                     1
                     5714317017702887126855220755702207457494795322418212890625) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256_24
  (expected-env-p (env/exec (env-with-pre-expPowerOf256_24))
                  (env-with-post-expPowerOf256_24)))