
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-DynamicJumpStartWithJumpDest ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "5b586000555960115758600052596000575b58600055")
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
        0
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

(defun env-with-pre-DynamicJumpStartWithJumpDest ()
    (mk-initial-env-DynamicJumpStartWithJumpDest))

(defun env-with-post-DynamicJumpStartWithJumpDest ()
    (env/set-halted 
  (env/storage/store   (mk-initial-env-DynamicJumpStartWithJumpDest)
                     0
                     18) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-DynamicJumpStartWithJumpDest
  (expected-env-p (env/exec (env-with-pre-DynamicJumpStartWithJumpDest))
                  (env-with-post-DynamicJumpStartWithJumpDest)))