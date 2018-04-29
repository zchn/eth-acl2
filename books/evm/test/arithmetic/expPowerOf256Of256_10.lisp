
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-expPowerOf256Of256_10 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "600a6101000a6101000a600055600a60ff0a6101000a600155600a6101010a6101000a600255600a6101000a60ff0a600355600a60ff0a60ff0a600455600a6101010a60ff0a600555600a6101000a6101010a600655600a60ff0a6101010a600755600a6101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_10 ()
    (mk-initial-env-expPowerOf256Of256_10))

(defun env-with-post-expPowerOf256Of256_10 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store   (mk-initial-env-expPowerOf256Of256_10)
                               7
                               11024531560426914560193215886265230714814461857853456442906740807421673210113)
                             6
                             20484820853245168917669616382018121754787019534209236968739196776128530350081)
                           8
                           75819177417320365411421114579935983460137159977655625167576545660532198867201)
                         4
                         87710304769150807214235028736827993866595394348364203769770205211527048724735)
                       3
                       114914632844046583933260134950687189314890709482596989657240944241417975234561)
                     5
                     39290610890452765349502690951550527297496048075653585758833528807928504123647) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_10
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_10))
                  (env-with-post-expPowerOf256Of256_10)))