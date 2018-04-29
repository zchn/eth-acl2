
(in-package "ACL2")

(include-book "../env")
(include-book "../exec")
(include-book "helper")

(defun mk-initial-env-expPowerOf256_29 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "601d6101000a600055601d60ff0a600155601d6101010a600255")
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

(defun env-with-pre-expPowerOf256_29 ()
    (mk-initial-env-expPowerOf256_29))

(defun env-with-post-expPowerOf256_29 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store   (mk-initial-env-expPowerOf256_29)
                         1
                         6161198947895343982399660568426761903988167460346780717372894287109375)
                       0
                       6901746346790563787434755862277025452451108972170386555162524223799296)
                     2
                     7727883682589755429839543181003123889866610449799515773033206399769857) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256_29
  (expected-env-p (env/exec (env-with-pre-expPowerOf256_29))
                  (env-with-post-expPowerOf256_29)))