
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-dup12 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "600c600b600a6009600860076006600560046003600260018b600355")
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

(defun env-with-pre-dup12 ()
    (mk-initial-env-dup12))

(defun env-with-post-dup12 ()
    (env/set-halted 
  (env/storage/store   (mk-initial-env-dup12)
                     3
                     12) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-dup12
  (expected-env-p (env/exec (env-with-pre-dup12))
                  (env-with-post-dup12)))