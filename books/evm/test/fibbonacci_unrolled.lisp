
(in-package "ACL2")

(include-book "../env")
(include-book "../exec")

(defun mk-initial-env-fibbonacci_unrolled ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "6001600181810181810181810181810181810181810181810181810181810181810181810181810181810181810181810181810181810160005260206000f3")
    ;; stack
    (mk-empty-stack)
    ;; mem
    (mk-empty-memory)
    ;; storage
    (mk-empty-storage)
    ;; halted
    nil
    ;; gas
    1000000
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

(defun env-with-pre-fibbonacci_unrolled ()
    (mk-initial-env-fibbonacci_unrolled))

(defun env-with-post-fibbonacci_unrolled ()
    (mk-initial-env-fibbonacci_unrolled))
(defthm storage-equiv-fibbonacci_unrolled
  (alist-equiv (env/storage (env/exec (env-with-pre-fibbonacci_unrolled)))
               (env/storage (env-with-post-fibbonacci_unrolled))))