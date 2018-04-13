
(in-package "ACL2")

(include-book "../env")
(include-book "../exec")

(defun mk-initial-env-exp0 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "600260020a600055")
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
      1170859069521887415590932569929099639409724315265
      ;; ip
      100000000000000
      ;; id
      "0x"
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

(defun env-with-pre-exp0 ()
    (mk-initial-env-exp0))

(defun env-with-post-exp0 ()
  
  (env/storage/store   (mk-initial-env-exp0)
                     0
                     4))
(defthm storage-equiv-exp0
  (alist-equiv (env/storage (env/exec (env-with-pre-exp0)))
               (env/storage (env-with-post-exp0))))