
(in-package "ACL2")

(include-book "../env")
(include-book "../exec")
(include-book "helper")

(defun mk-initial-env-expPowerOf256Of256_12 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "600c6101000a6101000a600055600c60ff0a6101000a600155600c6101010a6101000a600255600c6101000a60ff0a600355600c60ff0a60ff0a600455600c6101010a60ff0a600555600c6101000a6101010a600655600c60ff0a6101010a600755600c6101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_12 ()
    (mk-initial-env-expPowerOf256Of256_12))

(defun env-with-post-expPowerOf256Of256_12 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store   (mk-initial-env-expPowerOf256Of256_12)
                               5
                               93752052283216392393116198718556172755601810993178115549913696304169392799999)
                             7
                             27079447990334421832768535213001382538364337104003887072154060444218791559425)
                           4
                           88884190982786141138179309319347702000408571864083758904533741801152047218943)
                         8
                         28625806625801789859034042498407601320406435797081589212686750536894719459585)
                       6
                       74991547227499153688926126987451352010669639751209250187538225368170577788929)
                     3
                     80019368324629526638747930237288975316558411254569129739228874063734837870593) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_12
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_12))
                  (env-with-post-expPowerOf256Of256_12)))