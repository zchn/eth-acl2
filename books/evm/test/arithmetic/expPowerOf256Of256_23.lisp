
(in-package "ACL2")

(include-book "../env")
(include-book "../exec")
(include-book "helper")

(defun mk-initial-env-expPowerOf256Of256_23 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "60176101000a6101000a600055601760ff0a6101000a60015560176101010a6101000a60025560176101000a60ff0a600355601760ff0a60ff0a60045560176101010a60ff0a60055560176101000a6101010a600655601760ff0a6101010a60075560176101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_23 ()
    (mk-initial-env-expPowerOf256Of256_23))

(defun env-with-post-expPowerOf256Of256_23 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store   (mk-initial-env-expPowerOf256Of256_23)
                               5
                               60725702600970256357882219932341380643608066257735113198817913599684720918783)
                             4
                             37762166224943216354061133881990828131179932191099912485812863065457132175103)
                           8
                           38838507269272866444318461020062831438059409336168580428448728650033864835329)
                         3
                         89268533314566532404831973793582839324626494044866783105312323266711178444801)
                       7
                       39191009359259173528470521365271419600056804692268038397265417242355032391425)
                     6
                     65007838489074471546542423180695635713241448165562221873945885887695534686209) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_23
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_23))
                  (env-with-post-expPowerOf256Of256_23)))