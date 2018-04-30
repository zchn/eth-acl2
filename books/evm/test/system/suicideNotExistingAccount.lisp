
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-suicideNotExistingAccount ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "73aa1722f3947def4cf144679da39c4c32bdc35681ff")
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

(defun env-with-pre-suicideNotExistingAccount ()
    (mk-initial-env-suicideNotExistingAccount))

(defun env-with-post-suicideNotExistingAccount ()
    (env/set-halted (mk-initial-env-suicideNotExistingAccount) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-suicideNotExistingAccount
  (expected-env-p (env/exec (env-with-pre-suicideNotExistingAccount))
                  (env-with-post-suicideNotExistingAccount)))