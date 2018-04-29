
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-expPowerOf256Of256_14 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "600e6101000a6101000a600055600e60ff0a6101000a600155600e6101010a6101000a600255600e6101000a60ff0a600355600e60ff0a60ff0a600455600e6101010a60ff0a600555600e6101000a6101010a600655600e60ff0a6101010a600755600e6101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_14 ()
    (mk-initial-env-expPowerOf256Of256_14))

(defun env-with-post-expPowerOf256Of256_14 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store   (mk-initial-env-expPowerOf256Of256_14)
                               6
                               101656667831445454371959219483138111838033319621999128300415596713351307067393)
                             8
                             92859850393288921948278045707683108445628062778327872864204574351935748833537)
                           5
                           28709703754750430860229520230767157586576999441276879698135528982523256111359)
                         4
                         59695912561066707238569545894561715648962424372877657499564472558682379518207)
                       3
                       99326861617797847825989094377338474355592720485724747187463584063301701599233)
                     7
                     58439732298837688121708859932549010044236910193436024683432213454604389712129) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_14
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_14))
                  (env-with-post-expPowerOf256Of256_14)))