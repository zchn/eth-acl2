
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-JDfromStorageDynamicJumpiAfterStop ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "6001600860005401570060015b6002600355")
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
        2
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

(defun env-with-pre-JDfromStorageDynamicJumpiAfterStop ()
  
  (env/storage/store   (mk-initial-env-JDfromStorageDynamicJumpiAfterStop)
                     0
                     4))

(defun env-with-post-JDfromStorageDynamicJumpiAfterStop ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store   (mk-initial-env-JDfromStorageDynamicJumpiAfterStop)
                       3
                       2)
                     0
                     4) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-JDfromStorageDynamicJumpiAfterStop
  (expected-env-p (env/exec (env-with-pre-JDfromStorageDynamicJumpiAfterStop))
                  (env-with-post-JDfromStorageDynamicJumpiAfterStop)))