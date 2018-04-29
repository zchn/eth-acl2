
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-DynamicJumpJD_DependsOnJumps1 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "600a436006575b5660015b6001600155")
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
        1
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

(defun env-with-pre-DynamicJumpJD_DependsOnJumps1 ()
    (mk-initial-env-DynamicJumpJD_DependsOnJumps1))

(defun env-with-post-DynamicJumpJD_DependsOnJumps1 ()
    (env/set-halted 
  (env/storage/store   (mk-initial-env-DynamicJumpJD_DependsOnJumps1)
                     1
                     1) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-DynamicJumpJD_DependsOnJumps1
  (expected-env-p (env/exec (env-with-pre-DynamicJumpJD_DependsOnJumps1))
                  (env-with-post-DynamicJumpJD_DependsOnJumps1)))