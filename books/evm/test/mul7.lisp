
(in-package "ACL2")

(include-book "../env")
(include-book "../exec")
(include-book "helper")

(defun mk-initial-env-mul7 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "7001234567890abcdef0fedcba09876543217001234567890abcdef0fedcba09876543217001234567890abcdef0fedcba0987654321020260005260206000f3")
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
      nil
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

(defun env-with-pre-mul7 ()
    (mk-initial-env-mul7))

(defun env-with-post-mul7 ()
  
  (env/set-halted   (mk-initial-env-mul7)
                  (cons 'return (list #x47 #xd0 #x81 #x7e #x41 #x67 #xb1 #xeb #x4f #x9f #xc7 #x22 #xb1 #x33 #xef #x9d #x7d #x9a #x6f #xb4 #xc2 #xc1 #xc4 #x42 #xd0 #x00 #x10 #x7a #x5e #x41 #x95 #x61))))

(defthm expect-mul7
  (expected-env-p (env/exec (env-with-pre-mul7))
                  (env-with-post-mul7)))