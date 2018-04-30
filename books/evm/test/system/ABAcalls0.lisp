
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-ABAcalls0 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "6000600060006000601873945304eb96065b2a98b57a48a06ae28d285a71b56103e8f15855")
    ;; stack
    (mk-empty-stack)
    ;; mem
    (mk-empty-memory)
    ;; storage
    (mk-empty-storage)
    ;; halted
    nil
    ;; gas
    10000000000000
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
      100000
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

(defun env-with-pre-ABAcalls0 ()
    (mk-initial-env-ABAcalls0))

(defun env-with-post-ABAcalls0 ()
    (env/set-halted 
  (env/storage/store   (mk-initial-env-ABAcalls0)
                     35
                     1) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-ABAcalls0
  (expected-env-p (env/exec (env-with-pre-ABAcalls0))
                  (env-with-post-ABAcalls0)))