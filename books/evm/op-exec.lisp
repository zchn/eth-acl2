(in-package "ACL2")

(local (include-book "std/strings/top" :dir :system))
(include-book "std/strings/pretty" :dir :system)

(include-book "base")
(include-book "env")

(defun exec-unsupported (env op)
  (let ((tmp-env
          (env/set-halted env (cons 'unsupported (str::cat "Halted: unsupported OP:" op)))))
    (env/pc++ tmp-env)))

(defun exec-stop (env)
  (let ((tmp-env (env/set-halted env (cons 'stop "Halted: STOP."))))
    (env/pc++ tmp-env)))

(defun exec-add (env)
  (let* ((op0 (env/stack/n env 0))
         (op1 (env/stack/n env 1))
         (tmp-env (env/stack/push (env/stack/popn env 2) (modfix-w256 (+ op0 op1))))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-mul (env)
  (let* ((op0 (env/stack/n env 0))
         (op1 (env/stack/n env 1))
         (tmp-env (env/stack/push (env/stack/popn env 2) (modfix-w256 (* op0 op1))))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-sub (env)
  (let* ((op0 (env/stack/n env 0))
         (op1 (env/stack/n env 1))
         (tmp-env (env/stack/push (env/stack/popn env 2) (signed-to-unsigned-w256 (- op0 op1))))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-div (env)
  (let* ((op0 (env/stack/n env 0))
         (op1 (env/stack/n env 1))
         (tmp-env (env/stack/push (env/stack/popn env 2)
                                  (if (zp op1) 0 (truncate op0 op1))))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-sdiv (env)
  (let* ((sop0 (unsigned-to-signed-w256 (env/stack/n env 0)))
         (sop1 (unsigned-to-signed-w256 (env/stack/n env 1)))
         (sresult (if (zerop sop1) 0
                      (if (and (equal sop0
                                     (- (expt 2 255)))
                              (equal sop1 -1))
                          (- (expt 2 255))
                          (truncate sop0 sop1))))
         (tmp-env (env/stack/push (env/stack/popn env 2)
                                  (signed-to-unsigned-w256 sresult)))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-mod (env)
  (let* ((op0 (env/stack/n env 0))
         (op1 (env/stack/n env 1))
         (tmp-env (env/stack/push (env/stack/popn env 2)
                                  (if (zp op1) 0 (mod op0 op1))))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-smod (env)
  (let* ((sop0 (unsigned-to-signed-w256 (env/stack/n env 0)))
         (sop1 (unsigned-to-signed-w256 (env/stack/n env 1)))
         (sresult (if (zerop sop1) 0
                      (* (signum sop0) (mod (abs sop0)
                                            (abs sop1)))))
         (tmp-env (env/stack/push (env/stack/popn env 2)
                                  (signed-to-unsigned-w256 sresult)))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-addmod (env)
  (let* ((op0 (env/stack/n env 0))
         (op1 (env/stack/n env 1))
         (modu (env/stack/n env 2))
         (tmp-env
           (env/stack/push
            (env/stack/popn env 3)
            (if (zp modu) 0
                (modfix-w256 (mod (+ op0 op1) modu)))))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-mulmod (env)
  (let* ((op0 (env/stack/n env 0))
         (op1 (env/stack/n env 1))
         (modu (env/stack/n env 2))
         (tmp-env
           (env/stack/push
            (env/stack/popn env 3)
            (if (zp modu) 0
                (modfix-w256 (mod (* op0 op1) modu)))))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-exp (env)
  (let* ((op0 (env/stack/n env 0))
         (op1 (env/stack/n env 1))
         (tmp-env (env/stack/push (env/stack/popn env 2) (expt-w256 op0 op1)))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-signextend (env)
  (let* ((nbytes (env/stack/n env 0))
         (soriginal (env/stack/n env 1))
         (tmp-env (env/stack/push (env/stack/popn env 2)
                                  (if (<= 31 nbytes) soriginal
                                    (signed-to-unsigned-w256
                                     (unsigned-to-signed-nbits soriginal (* 8 (1+ nbytes)))))))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-lt (env)
  (let* ((op0 (env/stack/n env 0))
         (op1 (env/stack/n env 1))
         (tmp-env (env/stack/push (env/stack/popn env 2)
                                  (if (< op0 op1) 1 0)))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-gt (env)
  (let* ((op0 (env/stack/n env 0))
         (op1 (env/stack/n env 1))
         (tmp-env (env/stack/push (env/stack/popn env 2)
                                  (if (> op0 op1) 1 0)))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-slt (env)
  (let* ((sop0 (unsigned-to-signed-w256 (env/stack/n env 0)))
         (sop1 (unsigned-to-signed-w256 (env/stack/n env 1)))
         (tmp-env (env/stack/push (env/stack/popn env 2)
                                  (if (< sop0 sop1) 1 0)))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-sgt (env)
  (let* ((sop0 (unsigned-to-signed-w256 (env/stack/n env 0)))
         (sop1 (unsigned-to-signed-w256 (env/stack/n env 1)))
         (tmp-env (env/stack/push (env/stack/popn env 2)
                                  (if (> sop0 sop1) 1 0)))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-eq (env)
  (let* ((op0 (env/stack/n env 0))
         (op1 (env/stack/n env 1))
         (tmp-env (env/stack/push (env/stack/popn env 2)
                                  (if (equal op0 op1) 1 0)))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-iszero (env)
  (let* ((op0 (env/stack/n env 0))
         (tmp-env (env/stack/push (env/stack/popn env 1)
                                  (if (zp op0) 1 0)))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-and (env)
  (let* ((op0 (env/stack/n env 0))
         (op1 (env/stack/n env 1))
         (tmp-env (env/stack/push (env/stack/popn env 2) (logand op0 op1)))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-or (env)
  (let* ((op0 (env/stack/n env 0))
         (op1 (env/stack/n env 1))
         (tmp-env (env/stack/push (env/stack/popn env 2) (logior op0 op1)))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-xor (env)
  (let* ((op0 (env/stack/n env 0))
         (op1 (env/stack/n env 1))
         (tmp-env (env/stack/push (env/stack/popn env 2) (logxor op0 op1)))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-not (env)
  (let* ((sop0 (unsigned-to-signed-w256 (env/stack/n env 0)))
         (tmp-env (env/stack/push (env/stack/popn env 1) (signed-to-unsigned-w256 (lognot sop0))))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-byte (env)
  (let* ((boffset (env/stack/n env 0))
         (original (env/stack/n env 1))
         (tmp-env (env/stack/push (env/stack/popn env 2) (nth boffset (w-to-bytes original 32))))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-sha3 (env)
  (exec-unsupported env "SHA3"))

(defun exec-address (env)
  (let* ((tmp-env (env/stack/push env (env/context/Ia env)))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-balance (env)
  (exec-unsupported env "BALANCE"))

(defun exec-origin (env)
  (let* ((tmp-env (env/stack/push env (env/context/Io env)))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-caller (env)
  (let* ((tmp-env (env/stack/push env (env/context/Is env)))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-callvalue (env)
  (let* ((tmp-env (env/stack/push env (env/context/Iv env)))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-calldataload (env)
  (let* ((addr (env/stack/n env 0))
         (tmp-env (env/stack/push (env/stack/popn env 1)
                                  (take 32 (nthcdr (env/context/Id env) addr))))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-calldatasize (env)
  (let* ((datasize (length (env/context/Id env)))
         (tmp-env (env/stack/push env datasize))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-calldatacopy (env)
  (let* ((memaddr (env/stack/n env 0))
         (inaddr (env/stack/n env 1))
         (datasize (env/stack/n env 2))
         (stored-env
           (env/mem/store-byte-array (env/stack/popn env 3)
                                     memaddr
                                     (take datasize (nthcdr (env/context/Id env)
                                                            inaddr))))
         (new-env (env/pc++ stored-env)))
    new-env))

(defun exec-codesize (env)
  (let* ((filled-env (env/stack/push env
                      (env/rom/datasize env)))
         (new-env (env/pc++ filled-env)))
    new-env))

(defun exec-codecopy (env)
  (let* ((mem-start (env/stack/n env 0))
         (rom-start (env/stack/n env 1))
         ;; TODO(zchn): Handle gas from (stack/n stack 2)
         (popped-env (env/stack/popn env 3))
         (memmed-env
           (env/mem/store-byte-array
            popped-env mem-start
            (env/rom/byte-list-nthcdr popped-env rom-start)))
         (new-env (env/pc++ memmed-env)))
    new-env))

(defun exec-gasprice (env)
  (let* ((filled-env (env/stack/push env (env/context/Ip env)))
         (new-env (env/pc++ filled-env)))
    new-env))

(defun exec-extcodesize (env)
  (exec-unsupported env "EXTCODESIZE"))

(defun exec-extcodecopy (env)
  (exec-unsupported env "EXTCODECOPY"))

(defun exec-blockhash (env)
  (exec-unsupported env "BLOCKHASH"))

(defun exec-coinbase (env)
  (let* ((pushed-env
           (env/stack/push env
                           (env/context/Ihc env)))
         (new-env (env/pc++ pushed-env)))
    new-env))

(defun exec-timestamp (env)
  (let* ((pushed-env
           (env/stack/push env
                           (env/context/Ihs env)))
         (new-env (env/pc++ pushed-env)))
    new-env))

(defun exec-number (env)
  (let* ((pushed-env
           (env/stack/push env
                           (env/context/Ihi env)))
         (new-env (env/pc++ pushed-env)))
    new-env))

(defun exec-difficulty (env)
  (let* ((pushed-env
           (env/stack/push env
                           (env/context/Ihd env)))
         (new-env (env/pc++ pushed-env)))
    new-env))

(defun exec-gaslimit (env)
  (let* ((pushed-env
           (env/stack/push env
                           (env/context/Ihl env)))
         (new-env (env/pc++ pushed-env)))
    new-env))

(defun exec-pop (env)
  (let* ((tmp-env (env/stack/popn env 1))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-mload (env)
  (let* ((mem-addr (env/stack/n env 0))
         (tmp-env (env/stack/popn env 1))
         (tmp2-env (env/stack/push tmp-env (env/mem/load-w256 tmp-env mem-addr)))
         (new-env (env/pc++ tmp2-env)))
    new-env))

(defun exec-mstore (env)
  (let* ((mem-addr (env/stack/n env 0))
         (value (env/stack/n env 1))
         (tmp-env (env/stack/popn env 2))
         (tmp2-env (env/mem/store-w256 tmp-env mem-addr value))
         (new-env (env/pc++ tmp2-env)))
    new-env))

(defun exec-mstore8 (env)
  (let* ((mem-addr (env/stack/n env 0))
         (value (env/stack/n env 1))
         (tmp-env (env/stack/popn env 2))
         (tmp2-env (env/mem/store-byte tmp-env mem-addr value))
         (new-env (env/pc++ tmp2-env)))
    new-env))

(defun exec-sload (env)
  (let* ((s-addr (env/stack/n env 0))
         (tmp0-env (env/stack/popn env 1))
         (tmp-env (env/stack/push tmp0-env (env/storage/load env s-addr)))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-sstore (env)
  (let* ((s-addr (env/stack/n env 0))
         (s-value (env/stack/n env 1))
         (tmp-env (env/stack/popn env 2))
         (tmp2-env (env/storage/store tmp-env s-addr s-value))
         (new-env (env/pc++ tmp2-env)))
    new-env))

(defun exec-jump (env)
  (let* ((dest (env/stack/n env 0))
         (tmp-env (env/stack/popn env 1))
         (new-env (env/set-pc tmp-env dest)))
    new-env))

(defun exec-jumpi (env)
  (let* ((dest (env/stack/n env 0))
         (condition (env/stack/n env 1))
         (tmp-env (env/stack/popn env 2))
         (new-env (if (zp condition)
                      (env/pc++ tmp-env)
                      (env/set-pc env dest))))
    new-env))

(defun exec-pc (env)
  (let* ((tmp-env (env/stack/push env
                                  (env/pc env)))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-msize (env)
  (exec-unsupported env "MSIZE"))

(defun exec-gas (env)
  (exec-unsupported env "GAS"))

(defun exec-jumpdest (env) (env/pc++ env))

(defun exec-push-helper (env n)
  (let* ((pc (env/pc env))
         (rom (env/rom env))
         (value-to-push (rom/n-w-helper rom (+ pc 1) n))
         (tmp-env (env/stack/push env value-to-push))
         (new-env (env/pc+n tmp-env (1+ n))))
    new-env))

(defun exec-push1 (env) (exec-push-helper env 1))
(defun exec-push2 (env) (exec-push-helper env 2))
(defun exec-push3 (env) (exec-push-helper env 3))
(defun exec-push4 (env) (exec-push-helper env 4))
(defun exec-push5 (env) (exec-push-helper env 5))
(defun exec-push6 (env) (exec-push-helper env 6))
(defun exec-push7 (env) (exec-push-helper env 7))
(defun exec-push8 (env) (exec-push-helper env 8))
(defun exec-push9 (env) (exec-push-helper env 9))
(defun exec-push10 (env) (exec-push-helper env 10))
(defun exec-push11 (env) (exec-push-helper env 11))
(defun exec-push12 (env) (exec-push-helper env 12))
(defun exec-push13 (env) (exec-push-helper env 13))
(defun exec-push14 (env) (exec-push-helper env 14))
(defun exec-push15 (env) (exec-push-helper env 15))
(defun exec-push16 (env) (exec-push-helper env 16))
(defun exec-push17 (env) (exec-push-helper env 17))
(defun exec-push18 (env) (exec-push-helper env 18))
(defun exec-push19 (env) (exec-push-helper env 19))
(defun exec-push20 (env) (exec-push-helper env 20))
(defun exec-push21 (env) (exec-push-helper env 21))
(defun exec-push22 (env) (exec-push-helper env 22))
(defun exec-push23 (env) (exec-push-helper env 23))
(defun exec-push24 (env) (exec-push-helper env 24))
(defun exec-push25 (env) (exec-push-helper env 25))
(defun exec-push26 (env) (exec-push-helper env 26))
(defun exec-push27 (env) (exec-push-helper env 27))
(defun exec-push28 (env) (exec-push-helper env 28))
(defun exec-push29 (env) (exec-push-helper env 29))
(defun exec-push30 (env) (exec-push-helper env 30))
(defun exec-push31 (env) (exec-push-helper env 31))
(defun exec-push32 (env) (exec-push-helper env 32))

(defun exec-dup-helper (env n)
  (let* ((op (env/stack/n env (1- n)))
         (tmp-env (env/stack/push env op))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-dup1 (env) (exec-dup-helper env 1))
(defun exec-dup2 (env) (exec-dup-helper env 2))
(defun exec-dup3 (env) (exec-dup-helper env 3))
(defun exec-dup4 (env) (exec-dup-helper env 4))
(defun exec-dup5 (env) (exec-dup-helper env 5))
(defun exec-dup6 (env) (exec-dup-helper env 6))
(defun exec-dup7 (env) (exec-dup-helper env 7))
(defun exec-dup8 (env) (exec-dup-helper env 8))
(defun exec-dup9 (env) (exec-dup-helper env 9))
(defun exec-dup10 (env) (exec-dup-helper env 10))
(defun exec-dup11 (env) (exec-dup-helper env 11))
(defun exec-dup12 (env) (exec-dup-helper env 12))
(defun exec-dup13 (env) (exec-dup-helper env 13))
(defun exec-dup14 (env) (exec-dup-helper env 14))
(defun exec-dup15 (env) (exec-dup-helper env 15))
(defun exec-dup16 (env) (exec-dup-helper env 16))

(defun exec-swap-swapper (env n)
  (declare (xargs :measure (nfix n)))
  (if (zp n) env
      (if (equal n 1)
          (let* ((op0 (env/stack/n env 0))
                 (op1 (env/stack/n env 1))
                 (tmp-env (env/stack/push
                           (env/stack/push (env/stack/popn env 2) op0)
                           op1)))
            tmp-env)
          (let* ((op0 (env/stack/n env 0))
                 (swap-n-1-env (exec-swap-swapper (env/stack/popn env 1) (1- n)))
                 (pushed-env (env/stack/push swap-n-1-env op0)))
            (exec-swap-swapper pushed-env 1)))))

(defun exec-swap-helper (env n)
  (let* ((tmp-env (exec-swap-swapper env n))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-swap1 (env) (exec-swap-helper env 1))
(defun exec-swap2 (env) (exec-swap-helper env 2))
(defun exec-swap3 (env) (exec-swap-helper env 3))
(defun exec-swap4 (env) (exec-swap-helper env 4))
(defun exec-swap5 (env) (exec-swap-helper env 5))
(defun exec-swap6 (env) (exec-swap-helper env 6))
(defun exec-swap7 (env) (exec-swap-helper env 7))
(defun exec-swap8 (env) (exec-swap-helper env 8))
(defun exec-swap9 (env) (exec-swap-helper env 9))
(defun exec-swap10 (env) (exec-swap-helper env 10))
(defun exec-swap11 (env) (exec-swap-helper env 11))
(defun exec-swap12 (env) (exec-swap-helper env 12))
(defun exec-swap13 (env) (exec-swap-helper env 13))
(defun exec-swap14 (env) (exec-swap-helper env 14))
(defun exec-swap15 (env) (exec-swap-helper env 15))
(defun exec-swap16 (env) (exec-swap-helper env 16))

(defun exec-log-helper (env n)
  (let* (;; TODO(zchn): Actually support log operations
         (tmp-env (env/stack/popn env (+ n 2)))
         (new-env (env/pc++ tmp-env)))
    new-env))

(defun exec-log0 (env) (exec-log-helper env 0))
(defun exec-log1 (env) (exec-log-helper env 1))
(defun exec-log2 (env) (exec-log-helper env 2))
(defun exec-log3 (env) (exec-log-helper env 3))
(defun exec-log4 (env) (exec-log-helper env 4))

(defun exec-create (env)
  (exec-unsupported env "CREATE"))

(defun exec-call (env)
  (exec-unsupported env "CALL"))

(defun exec-callcode (env)
  (exec-unsupported env "CALLCODE"))

(defun exec-return (env)
  (let* ((mem-start (env/stack/n env 0))
         (mem-len (env/stack/n env 1))
         (popped-env (env/stack/popn env 2))
         (halted-env (env/set-halted popped-env
                                     (cons 'return (env/mem/load-byte-array popped-env
                                                                            mem-start
                                                                            mem-len))))
         (new-env (env/pc++ halted-env)))
    new-env))

(defun exec-delegatecall (env)
  (exec-unsupported env "DELEGATECALL"))

(defun exec-revert (env)
  (let* (;; TODO(zchn): calculate the correct gas consumption.
         (popped-env (env/stack/popn env 2))
         (reverted-env (env/set-substate popped-env (mk-empty-substate)))
         (halted-env (env/set-halted reverted-env (cons 'revert "Halted: REVERT")))
         (new-env (env/pc++ halted-env)))
    new-env))

(defun exec-invalid (env)
  (exec-unsupported env "INVALID"))

(defun exec-selfdestruct (env)
  (exec-unsupported env "SELFDESTRUCT"))

(defun exec-unknown (env)
  (let ((tmp-env
          (env/set-halted env (cons 'unknown (str::cat "Halted: unknown OP:"
                                                       (str::pretty (env/nextop env)))))))
    (env/pc++ tmp-env)))
