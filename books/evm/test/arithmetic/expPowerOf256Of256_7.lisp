
(in-package "ACL2")

(include-book "../env")
(include-book "../exec")
(include-book "helper")

(defun mk-initial-env-expPowerOf256Of256_7 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "60076101000a6101000a600055600760ff0a6101000a60015560076101010a6101000a60025560076101000a60ff0a600355600760ff0a60ff0a60045560076101010a60ff0a60055560076101000a6101010a600655600760ff0a6101010a60075560076101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_7 ()
    (mk-initial-env-expPowerOf256Of256_7))

(defun env-with-post-expPowerOf256Of256_7 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store   (mk-initial-env-expPowerOf256Of256_7)
                               8
                               4330632354923598824005817957634950183537333187179286018273483015945990897921)
                             5
                             43345747554253238299465711077671703817838237369468988784434413112512838303999)
                           6
                           90636177557414518135233707311441832681323290295963628475535580382064678010881)
                         4
                         76425605249543128808067971548918170160729791707747064947261918738976669564671)
                       3
                       63182715569273074787714100940498879016211333097847191821758787388556590448641)
                     7
                     18310447951348423009296867942901618951251473555818375822006835637692098150145) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_7
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_7))
                  (env-with-post-expPowerOf256Of256_7)))