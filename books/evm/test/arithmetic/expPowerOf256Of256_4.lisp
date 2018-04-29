
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-expPowerOf256Of256_4 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "60046101000a6101000a600055600460ff0a6101000a60015560046101010a6101000a60025560046101000a60ff0a600355600460ff0a60ff0a60045560046101010a60ff0a60055560046101000a6101010a600655600460ff0a6101010a60075560046101010a6101010a600855")
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

(defun env-with-pre-expPowerOf256Of256_4 ()
    (mk-initial-env-expPowerOf256Of256_4))

(defun env-with-post-expPowerOf256Of256_4 ()
    (env/set-halted 
  (env/storage/store 
    (env/storage/store 
      (env/storage/store 
        (env/storage/store 
          (env/storage/store 
            (env/storage/store   (mk-initial-env-expPowerOf256Of256_4)
                               8
                               101965897610888126403407041783167308378486948961680044692678870984371172802817)
                             5
                             105546705083962239776280838125382873088043929909358687231796858176367034106111)
                           3
                           104180459307073179463913335729947524956342847659456996136147549665912581783553)
                         6
                         104614202261512011900638534567018544938205717373709248053501147660488462565377)
                       7
                       20805755454287356068906442693618939408693780123187819689785872758108948529409)
                     4
                     45751977055995076893837051142492326735442329149693349358278717162318234124543) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-expPowerOf256Of256_4
  (expected-env-p (env/exec (env-with-pre-expPowerOf256Of256_4))
                  (env-with-post-expPowerOf256Of256_4)))