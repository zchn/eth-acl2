
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-CallRecursiveBomb2 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "600160005401600055600060006000600060003060e05a03f1600155")
    ;; stack
    (mk-empty-stack)
    ;; mem
    (mk-empty-memory)
    ;; storage
    (mk-empty-storage)
    ;; halted
    nil
    ;; gas
    364724
    ;; context
  
    (mk-context
      ;; ia
      87579061662017136990230301793909925042452127430
      ;; io
      1170859069862169782511871033392474246841492526721
      ;; ip
      1
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

(defun env-with-pre-CallRecursiveBomb2 ()
    (mk-initial-env-CallRecursiveBomb2))

(defun env-with-post-CallRecursiveBomb2 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store   (mk-initial-env-CallRecursiveBomb2)
                       0
                       1)
                     1
                     1) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-CallRecursiveBomb2
  (expected-env-p (env/exec (env-with-pre-CallRecursiveBomb2))
                  (env-with-post-CallRecursiveBomb2)))