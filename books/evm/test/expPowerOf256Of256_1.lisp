
(in-package "ACL2")

(include-book "../env")
(include-book "../exec")
(include-book "helper")

(defun mk-initial-env-expPowerOf256Of256_1 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "60016101000a6101000a600055600160ff0a6101000a60015560016101010a6101000a60025560016101000a60ff0a600355600160ff0a60ff0a60045560016101010a60ff0a60055560016101000a6101010a600655600160ff0a6101010a60075560016101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_1 ()
    (mk-initial-env-expPowerOf256Of256_1))

(defun env-with-post-expPowerOf256Of256_1 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store   (mk-initial-env-expPowerOf256Of256_1)
                               5
                               85446755687772089089393075192758792342486802455648082716356894688374033547519)
                             4
                             64946385749017250832482072853933863069726291388589506484671647877697625915135)
                           6
                           1226038936089917454166061297023693466909118688613925930124971309282338340865)
                         3
                         3059605063183016712277721510764259762596496903723495948835695681317069848577)
                       8
                       83507828100476394873535783317713405289103533642497835963202458469734694322433)
                     7
                     90115345861475988335285459389239709198914031330026174061562808454832327884545) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_1
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_1))
                  (env-with-post-expPowerOf256Of256_1)))