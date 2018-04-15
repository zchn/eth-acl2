
(in-package "ACL2")

(include-book "../env")
(include-book "../exec")
(include-book "helper")

(defun mk-initial-env-div1 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "60027ffedcba9876543210fedcba9876543210fedcba9876543210fedcba98765432100460005260206000f3")
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

(defun env-with-pre-div1 ()
    (mk-initial-env-div1))

(defun env-with-post-div1 ()
  
  (env/set-halted   (mk-initial-env-div1)
                  (cons 'return (list #x7f #x6e #x5d #x4c #x3b #x2a #x19 #x08 #x7f #x6e #x5d #x4c #x3b #x2a #x19 #x08 #x7f #x6e #x5d #x4c #x3b #x2a #x19 #x08 #x7f #x6e #x5d #x4c #x3b #x2a #x19 #x08))))

(defthm expect-div1
  (expected-env-p (env/exec (env-with-pre-div1))
                  (env-with-post-div1)))