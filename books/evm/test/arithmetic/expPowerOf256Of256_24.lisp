
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-expPowerOf256Of256_24 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "60186101000a6101000a600055601860ff0a6101000a60015560186101010a6101000a60025560186101000a60ff0a600355601860ff0a60ff0a60045560186101010a60ff0a60055560186101000a6101010a600655601860ff0a6101010a60075560186101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_24 ()
    (mk-initial-env-expPowerOf256Of256_24))

(defun env-with-post-expPowerOf256Of256_24 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store   (mk-initial-env-expPowerOf256Of256_24)
                               3
                               41702948777741797193501244445689020010195496354705359186810706719175142801409)
                             5
                             90022260026940719086649458685820469676814156683365485772963019848106668196095)
                           8
                           63456349992147796142899484244105564613077224608371012703923436064819027378433)
                         6
                         83737892266848770344209478015711919572202923197328142087712274118479341158401)
                       4
                       96460830178924398484922076248766509909499342148785790039585049283656451358975)
                     7
                     34667965620820543567793729481600811750612646439558795709621156892698571440385) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_24
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_24))
                  (env-with-post-expPowerOf256Of256_24)))