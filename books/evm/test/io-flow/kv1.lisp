
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-kv1 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "33604555602d80600f6000396000f3604554331415602c575b366080511015602b576020608051013560805135556040608051016080526009565b5b")
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

(defun env-with-pre-kv1 ()
    (mk-initial-env-kv1))

(defun env-with-post-kv1 ()
  
  (env/set-halted 
    (env/storage/store   (mk-initial-env-kv1)
                       69
                       1170859069862169782511871033392474246841492526721)
                  (cons 'return (list #x60 #x45 #x54 #x33 #x14 #x15 #x60 #x2c #x57 #x5b #x36 #x60 #x80 #x51 #x10 #x15 #x60 #x2b #x57 #x60 #x20 #x60 #x80 #x51 #x01 #x35 #x60 #x80 #x51 #x35 #x55 #x60 #x40 #x60 #x80 #x51 #x01 #x60 #x80 #x52 #x60 #x09 #x56 #x5b #x5b))))

(defthm expect-kv1
  (expected-env-p (env/exec (env-with-pre-kv1))
                  (env-with-post-kv1)))