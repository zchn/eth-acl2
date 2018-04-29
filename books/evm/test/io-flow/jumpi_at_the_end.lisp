
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-jumpi_at_the_end ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "600a6000525b6000516001900380600052600557")
    ;; stack
    (mk-empty-stack)
    ;; mem
    (mk-empty-memory)
    ;; storage
    (mk-empty-storage)
    ;; halted
    nil
    ;; gas
    1000
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

(defun env-with-pre-jumpi_at_the_end ()
    (mk-initial-env-jumpi_at_the_end))

(defun env-with-post-jumpi_at_the_end ()
    (env/set-halted (mk-initial-env-jumpi_at_the_end) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-jumpi_at_the_end
  (expected-env-p (env/exec (env-with-pre-jumpi_at_the_end))
                  (env-with-post-jumpi_at_the_end)))