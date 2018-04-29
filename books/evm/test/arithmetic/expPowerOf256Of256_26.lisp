
(in-package "ACL2")

(include-book "../env")
(include-book "../exec")
(include-book "helper")

(defun mk-initial-env-expPowerOf256Of256_26 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "601a6101000a6101000a600055601a60ff0a6101000a600155601a6101010a6101000a600255601a6101000a60ff0a600355601a60ff0a60ff0a600455601a6101010a60ff0a600555601a6101000a6101010a600655601a60ff0a6101010a600755601a6101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_26 ()
    (mk-initial-env-expPowerOf256Of256_26))

(defun env-with-post-expPowerOf256Of256_26 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store   (mk-initial-env-expPowerOf256Of256_26)
                               5
                               63130786578447000143359706132655438781703096764577257433234668088023930503423)
                             6
                             112022376074563568812658720950344193866391401393868338298317741635149131415553)
                           7
                           47580733608497810153764935870993478768529823747464839196957117315105893515521)
                         3
                         3768829712260290751596832614926327440601038856186643509120209088559741665281)
                       4
                       13156479618473122453827333675314833413833735874110900611322468555500321898751)
                     8
                     23524974130592294778780884663680818889754585050430865625920211481456128164097) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_26
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_26))
                  (env-with-post-expPowerOf256Of256_26)))