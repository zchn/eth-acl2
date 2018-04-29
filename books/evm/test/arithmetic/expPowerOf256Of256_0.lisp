
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-expPowerOf256Of256_0 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "60006101000a6101000a600055600060ff0a6101000a60015560006101010a6101000a60025560006101000a60ff0a600355600060ff0a60ff0a60045560006101010a60ff0a60055560006101000a6101010a600655600060ff0a6101010a60075560006101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_0 ()
    (mk-initial-env-expPowerOf256Of256_0))

(defun env-with-post-expPowerOf256Of256_0 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store 
              (env/storage/store 
                (env/storage/store 
                  (env/storage/store   (mk-initial-env-expPowerOf256Of256_0)
                                     7
                                     257)
                                   4
                                   255)
                                 1
                                 256)
                               3
                               255)
                             5
                             255)
                           2
                           256)
                         6
                         257)
                       8
                       257)
                     0
                     256) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_0
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_0))
                  (env-with-post-expPowerOf256Of256_0)))