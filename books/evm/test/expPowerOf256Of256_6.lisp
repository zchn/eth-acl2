
(in-package "ACL2")

(include-book "../env")
(include-book "../exec")
(include-book "helper")

(defun mk-initial-env-expPowerOf256Of256_6 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "60066101000a6101000a600055600660ff0a6101000a60015560066101010a6101000a60025560066101000a60ff0a600355600660ff0a60ff0a60045560066101010a60ff0a60055560066101000a6101010a600655600660ff0a6101010a60075560066101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_6 ()
    (mk-initial-env-expPowerOf256Of256_6))

(defun env-with-post-expPowerOf256Of256_6 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store   (mk-initial-env-expPowerOf256Of256_6)
                               6
                               3725531100599457640655441464738752256474927916455295396851587668754273665025)
                             3
                             11435072968476041248577174136455222083821632859290360317387830027612682452993)
                           8
                           58367409542318765371006823048891477968631145636400631624472570914463275155713)
                         7
                         39450714102859599482682422335408269864750442602220136464558252613040321724673)
                       4
                       29838683424993676685700745244695845239470248567130516709948292817813784625407)
                     5
                     107606274993353017652986210904939816968102791635211673659007043946902783918335) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_6
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_6))
                  (env-with-post-expPowerOf256Of256_6)))