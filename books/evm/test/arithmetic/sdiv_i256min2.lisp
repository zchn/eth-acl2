
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-sdiv_i256min2 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "60016000037f800000000000000000000000000000000000000000000000000000000000000060000305600055")
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

(defun env-with-pre-sdiv_i256min2 ()
    (mk-initial-env-sdiv_i256min2))

(defun env-with-post-sdiv_i256min2 ()
    (env/set-halted 
  (env/storage/store   (mk-initial-env-sdiv_i256min2)
                     0
                     57896044618658097711785492504343953926634992332820282019728792003956564819968) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-sdiv_i256min2
  (expected-env-p (env/exec (env-with-pre-sdiv_i256min2))
                  (env-with-post-sdiv_i256min2)))