
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-push27 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "7a5566778899aabbccddeeff00112233445566778899aabbccddeeff600355")
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

(defun env-with-pre-push27 ()
    (mk-initial-env-push27))

(defun env-with-post-push27 ()
    (env/set-halted 
  (env/storage/store   (mk-initial-env-push27)
                     3
                     35131629848125220974259712924447428653982015895563991539578171135) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-push27
  (expected-env-p (env/exec (env-with-pre-push27))
                  (env-with-post-push27)))