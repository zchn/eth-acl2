
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-expPowerOf256Of256_30 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "601e6101000a6101000a600055601e60ff0a6101000a600155601e6101010a6101000a600255601e6101000a60ff0a600355601e60ff0a60ff0a600455601e6101010a60ff0a600555601e6101000a6101010a600655601e60ff0a6101010a600755601e6101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_30 ()
    (mk-initial-env-expPowerOf256Of256_30))

(defun env-with-post-expPowerOf256Of256_30 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store   (mk-initial-env-expPowerOf256Of256_30)
                               4
                               105599420949718761373086994757860478259024540739650663766696805544756942864639)
                             8
                             89404147834226705822834044214734168223325601657396406432574474219566049132801)
                           7
                           114548869433232456914198824234733305079953169742594190201731254450200934220033)
                         6
                         58348357467241364100158816664534141066686828210420440473007923191487475482625)
                       3
                       57443731770074831323412168344153766786583156455220123566449660816425654157313)
                     5
                     23492387631362241410954083125785775807737875757943251864054532318400312377599) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_30
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_30))
                  (env-with-post-expPowerOf256Of256_30)))