
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-blockhashInRange ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "60014060005560024060015561010040600255")
    ;; stack
    (mk-empty-stack)
    ;; mem
    (mk-empty-memory)
    ;; storage
    (mk-empty-storage)
    ;; halted
    nil
    ;; gas
    100000
    ;; context
  
    (mk-context
      ;; ia
      87579061662017136990230301793909925042452127430
      ;; io
      1170859069862169782511871033392474246841492526721
      ;; ip
      100000000000000
      ;; id
      nil
      ;; is
      1170859069862169782511871033392474246841492526721
      ;; iv
      1000000000000000000
      ;; ih
  
      (mk-block-header
        ;; ihc
        244687034288125203496486448490407391986876152250
        ;; ihs
        1
        ;; ihi
        257
        ;; ihd
        256
        ;; ihl
        1000000)
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

(defun env-with-pre-blockhashInRange ()
    (mk-initial-env-blockhashInRange))

(defun env-with-post-blockhashInRange ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store   (mk-initial-env-blockhashInRange)
                         1
                         78469846343542442363028680824980501212021332975324075417961003849793346933925)
                       0
                       90743482286830539503240959006302832933333810038750515972785732718729991261126)
                     2
                     49141853235351966986450010456217574961379676238517164466470671864163950076078) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-blockhashInRange
  (expected-env-p (env/exec (env-with-pre-blockhashInRange))
                  (env-with-post-blockhashInRange)))