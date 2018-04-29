
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-expPowerOf256Of256_11 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "600b6101000a6101000a600055600b60ff0a6101000a600155600b6101010a6101000a600255600b6101000a60ff0a600355600b60ff0a60ff0a600455600b6101010a60ff0a600555600b6101000a6101010a600655600b60ff0a6101010a600755600b6101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_11 ()
    (mk-initial-env-expPowerOf256Of256_11))

(defun env-with-post-expPowerOf256Of256_11 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store   (mk-initial-env-expPowerOf256Of256_11)
                               4
                               18699204107595983543960872109239991216796489027696178041447150619885834993407)
                             6
                             46803055793531443315544302649156478669852813820237923809362846979832263213057)
                           7
                           38012487980709084869740788615251142802769579500832552471564899673176158240513)
                         5
                         28030588289907797419557822587653826454800612063029355821581199851736896569599)
                       3
                       101890553050602617754926015251507180655045683544561831677215663393899651530753)
                     8
                     99386799399269176133460845920098250474961692612186547558407604211935236260097) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_11
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_11))
                  (env-with-post-expPowerOf256Of256_11)))