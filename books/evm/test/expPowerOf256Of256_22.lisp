
(in-package "ACL2")

(include-book "../env")
(include-book "../exec")
(include-book "helper")

(defun mk-initial-env-expPowerOf256Of256_22 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "60166101000a6101000a600055601660ff0a6101000a60015560166101010a6101000a60025560166101000a60ff0a600355601660ff0a60ff0a60045560166101010a60ff0a60055560166101000a6101010a600655601660ff0a6101010a60075560166101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_22 ()
    (mk-initial-env-expPowerOf256Of256_22))

(defun env-with-post-expPowerOf256Of256_22 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store   (mk-initial-env-expPowerOf256Of256_22)
                               7
                               99934025607600089733745581488993139205016396189826818067336339035974376489217)
                             8
                             35007363591506868599869923830536024009816445536217041298284962531613703799041)
                           4
                           106866850240512374621662861338623158047087776162904039993394603528705656094975)
                         3
                         71814135284416114880191592207680751094301890903187796489607853892644475240449)
                       5
                       99765853430484146798068180455785111509035460348020690374049778250251620450559)
                     6
                     82574875311252429838423678495163651816438979130125565925996977247374551285761) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_22
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_22))
                  (env-with-post-expPowerOf256Of256_22)))