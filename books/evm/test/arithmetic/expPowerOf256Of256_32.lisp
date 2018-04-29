
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-expPowerOf256Of256_32 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "60206101000a6101000a600055602060ff0a6101000a60015560206101010a6101000a60025560206101000a60ff0a600355602060ff0a60ff0a60045560206101010a60ff0a60055560206101000a6101010a600655602060ff0a6101010a60075560206101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_32 ()
    (mk-initial-env-expPowerOf256Of256_32))

(defun env-with-post-expPowerOf256Of256_32 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store 
              (env/storage/store   (mk-initial-env-expPowerOf256Of256_32)
                                 4
                                 83290000642302749123389682511803062288674053658743011274318334092251811021055)
                               8
                               36720049077504322823338175525090117350613636142111226285606247996852040368385)
                             5
                             107796101041354274209995467705717706987961056180087872912716600609070003519743)
                           6
                           1)
                         0
                         1)
                       3
                       1)
                     7
                     107494645127108603178874279381187166621140539703347472922785670214454066807041) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_32
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_32))
                  (env-with-post-expPowerOf256Of256_32)))