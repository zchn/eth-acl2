
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-expPowerOf256_25 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "60196101000a600055601960ff0a60015560196101010a600255")
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

(defun env-with-pre-expPowerOf256_25 ()
    (mk-initial-env-expPowerOf256_25))

(defun env-with-post-expPowerOf256_25 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store   (mk-initial-env-expPowerOf256_25)
                         1
                         1457150839514236217348081292704062901661172807216644287109375)
                       2
                       1771446674072174508225286450717886232339530422363435486157057)
                     0
                     1606938044258990275541962092341162602522202993782792835301376) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256_25
  (expected-env-p (env/exec (env-with-pre-expPowerOf256_25))
                  (env-with-post-expPowerOf256_25)))