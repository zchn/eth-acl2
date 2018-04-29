
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-expPowerOf256Of256_21 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "60156101000a6101000a600055601560ff0a6101000a60015560156101010a6101000a60025560156101000a60ff0a600355601560ff0a60ff0a60045560156101010a60ff0a60055560156101000a6101010a600655601560ff0a6101010a60075560156101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_21 ()
    (mk-initial-env-expPowerOf256Of256_21))

(defun env-with-post-expPowerOf256Of256_21 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store   (mk-initial-env-expPowerOf256Of256_21)
                               4
                               57812011273622918000071749720687928256516815605767307141354861404086017982207)
                             3
                             61342758524695712879149510032736516840959960237361968522720240995941081939969)
                           8
                           32708451558369615005306371218201330517589418479369948923109316077262889877761)
                         7
                         12926000559402174768074498440631375790110453153840292162623164820974892089089)
                       5
                       46296291811536365292556049945344103552150633476469514979425859868512526598399)
                     6
                     322558106684579804056342494121733014907964762227052991898425692372556840961) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_21
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_21))
                  (env-with-post-expPowerOf256Of256_21)))