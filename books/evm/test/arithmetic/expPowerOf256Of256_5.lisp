
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-expPowerOf256Of256_5 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "60056101000a6101000a600055600560ff0a6101000a60015560056101010a6101000a60025560056101000a60ff0a600355600560ff0a60ff0a60045560056101010a60ff0a60055560056101000a6101010a600655600560ff0a6101010a60075560056101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_5 ()
    (mk-initial-env-expPowerOf256Of256_5))

(defun env-with-post-expPowerOf256Of256_5 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store   (mk-initial-env-expPowerOf256Of256_5)
                               4
                               53133720224321890553799294263499314496700729388928679458153706176025830096639)
                             8
                             82381723258049923464777114727664785506799309587382046227484519819802942177537)
                           5
                           114096355291310632328912361731577724574561909388773748730554036700263630569727)
                         7
                         50961515925585147602326301824865680942396506779474973511120656365903759671041)
                       3
                       82097736621887453144738928706488282125439196973497094669655819961703340179457)
                     6
                     93526145388008191859340524611820427621352466814415752457515217250352065675265) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_5
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_5))
                  (env-with-post-expPowerOf256Of256_5)))