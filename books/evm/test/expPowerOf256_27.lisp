
(in-package "ACL2")

(include-book "../env")
(include-book "../exec")
(include-book "helper")

(defun mk-initial-env-expPowerOf256_27 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "601b6101000a600055601b60ff0a600155601b6101010a600255")
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

(defun env-with-pre-expPowerOf256_27 ()
    (mk-initial-env-expPowerOf256_27))

(defun env-with-post-expPowerOf256_27 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store   (mk-initial-env-expPowerOf256_27)
                         1
                         94751233339413210033058986058081690180517761789262294769287109375)
                       2
                       117002281375793054093771944783465667759793644866682550425187457793)
                     0
                     105312291668557186697918027683670432318895095400549111254310977536) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256_27
  (expected-env-p (env/exec (env-with-pre-expPowerOf256_27))
                  (env-with-post-expPowerOf256_27)))