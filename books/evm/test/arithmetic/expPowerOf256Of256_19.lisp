
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-expPowerOf256Of256_19 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "60136101000a6101000a600055601360ff0a6101000a60015560136101010a6101000a60025560136101000a60ff0a600355601360ff0a60ff0a60045560136101010a60ff0a60055560136101000a6101010a600655601360ff0a6101010a60075560136101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_19 ()
    (mk-initial-env-expPowerOf256Of256_19))

(defun env-with-post-expPowerOf256Of256_19 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store   (mk-initial-env-expPowerOf256Of256_19)
                               4
                               83037708815083470159439176343059806764476791572127774164450033570118131384063)
                             7
                             78403999583194856336034090665674264222542182810896154607883723354325233434369)
                           3
                           58844010661592151918021960971670148005098640888438884074991120880745465249793)
                         5
                         14042401781101581299243232317313523558021645308348755647897149924594173542655)
                       6
                       80031109568047806892179495136963220151591982015680194332645608881349571117057)
                     8
                     98020625165909217120717684081299357790464904257325036365510282840011357487361) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_19
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_19))
                  (env-with-post-expPowerOf256Of256_19)))