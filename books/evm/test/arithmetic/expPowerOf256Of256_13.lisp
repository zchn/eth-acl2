
(in-package "ACL2")

(include-book "../env")
(include-book "../exec")
(include-book "helper")

(defun mk-initial-env-expPowerOf256Of256_13 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "600d6101000a6101000a600055600d60ff0a6101000a600155600d6101010a6101000a600255600d6101000a60ff0a600355600d60ff0a60ff0a600455600d6101010a60ff0a600555600d6101000a6101010a600655600d60ff0a6101010a600755600d6101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_13 ()
    (mk-initial-env-expPowerOf256Of256_13))

(defun env-with-post-expPowerOf256Of256_13 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store   (mk-initial-env-expPowerOf256Of256_13)
                               3
                               101385611762951987714492031095649658484764376091855612650967395547963616919553)
                             6
                             29704886013344757714156143369444407261954548115394473056019137567405601980417)
                           8
                           11715094450588063760202497755635816063485576587916768949517781391496719433985)
                         4
                         63278556072604564884482487087793889312459895451266827394465757221242014531327)
                       7
                       6180831967313900224885719403625820907184847095809151480761496615548164636417)
                     5
                     76503832981956381614151500340961475340424985318231630606058029623855335407871) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_13
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_13))
                  (env-with-post-expPowerOf256Of256_13)))