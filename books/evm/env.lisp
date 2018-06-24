(in-package "ACL2")

(include-book "context")
(include-book "memory")
(include-book "rom")
(include-book "stack")
(include-book "storage")
(include-book "substate")

(defun mk-env (pc rom stack mem storage halted gas context substate)
  (list pc rom stack mem storage halted gas context substate))

(defun mk-env-op (opstring)
  (mk-env 0
          (mk-rom opstring)
          (mk-empty-stack)
          (mk-empty-memory)
          (mk-empty-storage)
          nil
          100
          (mk-dummy-context)
          (mk-empty-substate)))

(defun env/pc (env) (nth 0 env))

(defun env/set-pc (env pc) (update-nth 0 (ifix pc) env))

(defun env/pc+n (env n) (env/set-pc env (+ n (env/pc env))))

(defun env/pc++ (env) (env/pc+n env 1))

(defun env/rom (env) (nth 1 env))

(defun env/rom/datasize (env) (rom/datasize (env/rom env)))

(defun env/rom/byte-list-nthcdr (env n)
  (rom/byte-list-nthcdr (env/rom env) n))

(defun env/stack (env) (nth 2 env))

(defun env/stack/n (env n) (stack/n (env/stack env) n))

(defun env/set-stack (env stack) (update-nth 2 stack env))

(defun env/stack/popn (env n)
  (env/set-stack env (stack/popn (env/stack env) n)))

(defun env/stack/push (env val)
  (env/set-stack env (stack/push (env/stack env) val)))

(defun env/mem (env) (nth 3 env))

(defun env/mem/size (env) (memory/size (env/mem env)))

(defun env/mem/load-w256 (env addr)
  (memory/load-w256 (env/mem env) addr))

(defun env/mem/load-byte-array (env mem-start mem-len)
  (memory/load-byte-array (env/mem env) mem-start mem-len))

(defun env/set-mem (env memory) (update-nth 3 memory env))

(defun env/mem/store-byte (env addr value)
  (env/set-mem env
               (memory/store-byte (env/mem env) addr value)))

(defun env/mem/store-byte-array (env addr array)
  (env/set-mem env
               (memory/store-byte-array (env/mem env) addr array)))

(defun env/mem/store-w256 (env addr value)
  (env/set-mem env
               (memory/store-w256 (env/mem env) addr value)))

(defun env/context (env) (nth 7 env))

(defun env/context/Ia (env) (context/Ia (env/context env)))

(defun env/context/Io (env) (context/Io (env/context env)))

(defun env/context/Ip (env) (context/Ip (env/context env)))

(defun env/context/Id (env) (context/Id (env/context env)))

(defun env/context/Is (env) (context/Is (env/context env)))

(defun env/context/Iv (env) (context/Iv (env/context env)))

(defun env/context/Ihc (env) (context/Ihc (env/context env)))

(defun env/context/Ihs (env) (context/Ihs (env/context env)))

(defun env/context/Ihi (env) (context/Ihi (env/context env)))

(defun env/context/Ihd (env) (context/Ihd (env/context env)))

(defun env/context/Ihl (env) (context/Ihl (env/context env)))

(defun env/context/Ie (env) (context/Ie (env/context env)))

(defun env/context/Iw (env) (context/Iw (env/context env)))

(defun env/set-context (env context) (update-nth 7 context env))

(defun env/storage (env) (nth 4 env))

(defun env/set-storage (env storage) (update-nth 4 storage env))

(defun env/storage/load (env offset)
  (storage/load (env/storage env) (env/context/Ia env) offset))

(defun env/storage/store (env offset value)
  (env/set-storage
   env (storage/store (env/storage env)
                      (env/context/Ia env)
                      offset
                      value)))

(defun env/halted (env) (nth 5 env))

(defun env/set-halted (env halted) (update-nth 5 halted env))

(defun halted/validp (halted)
  ;; The normal halting function is defined
  ;; H(mu, I) =
  ;;    * H_return(mu), if it's a RETURN
  ;;    * (), if it's a STOP or SELFDESTRUCT
  ;;    * empty, otherwise
  (or (not halted)
      (and (consp halted)
           (member-equal (car halted) (list 'out-of-range
                                            'return
                                            'revert
                                            'stop
                                            'invalid
                                            'selfdestruct
                                            'unknown
                                            'unsupported)))))

(defun env/halted/validp (env)
  (halted/validp (env/halted env)))

(defun env/gas (env) (nth 6 env))

(defun env/gas-- (env) (update-nth 6 (1- (env/gas env)) env))

(defun env/substate (env) (nth 8 env))

(defun env/set-substate (env substate) (update-nth 8 substate env))

(defun env/validp (env)
  (and (integerp (env/pc env))
       (rom/validp (env/rom env))
       (stack/validp (env/stack env))
       (memory/validp (env/mem env))
       (storage/validp (env/storage env))
       (env/halted/validp env)
       (natp (env/gas env)) ;; (gas/validp (env/gas env))
       (context/validp (env/context env))
       (substate/validp (env/substate env))))

(defun env/has-nextop (env)
  (let* ((pc (env/pc env))
         (rom (env/rom env)))
    (rom/has-n rom pc)))

(defun env/nextop (env) (let* ((pc (env/pc env))
                               (rom (env/rom env)))
                          (rom/n-op rom pc)))
