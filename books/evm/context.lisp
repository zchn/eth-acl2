(in-package "ACL2")

(defun mk-block-header (ihc ihs ihi ihd ihl)
  (list
   ;; I H c: beneficiary address, COINBASE
   ihc
   ;; I H s: timestamp
   ihs
   ;; I H i: number
   ihi
   ;; I H d: difficulty
   ihd
   ;; I H l: gas limit
   ihl))

(defun mk-dummy-block-header ()
  (mk-block-header "<beneficiary address>" 0 0 0 0))

(defun block-header/validp (bh)
  (and (listp bh)
       (equal (length bh) 5)))

;; Tuple I:
(defun mk-context (ia io ip id is iv ih ie iw)
  (list
   ;; I a , the address of the account which owns the code that is
   ;; executing.
   ia
   ;; I o , the sender address of the transaction that originated
   ;; this execution.
   io
   ;; I p , the price of gas in the transaction that originated this
   ;; execution.
   ip
   ;; I d , the byte array that is the input data to this execution;
   ;; if the execution agent is a transaction, this would be the
   ;; transaction data.
   id
   ;; I s , the address of the account which caused the code to be
   ;; executing; if the execution agent is a transaction, this would be
   ;; the transaction sender.
   is
   ;; I v , the value, in Wei, passed to this account as part of the same
   ;; procedure as execution; if the execution agent is a transaction,
   ;; this would be the transaction value.
   iv
   ;; [promoted to rom] I b , the byte array that is the machine code
   ;; to be executed.

   ;; I H , the block header of the present block.
   ih
   ;; I e , the depth of the present message-call or contract-creation
   ;; (i.e. the number of CALL s or CREATE s being executed at present).
   ie
   ;; I w , the permission to make modifications to the
   ;; state.
   iw))

(defun mk-dummy-context () (mk-context 198700 198701 198702 (list 19 87)
                                       ;; Is
                                       198704
                                       ;; Iv
                                       0
                                       ;; Ih
                                       (mk-dummy-block-header)
                                       ;; Ie
                                       "<call/create stack height>"
                                       ;; Iw
                                       "<permission>"))

(defun address/validp (address) (natp address))

(defun wei/validp (wei) (natp wei))

(defun context/Ia (context) (nth 0 context))

(defun context/Io (context) (nth 1 context))

(defun context/Ip (context) (nth 2 context))

(defun context/Id (context) (nth 3 context))

(defun context/Is (context) (nth 4 context))

(defun context/Iv (context) (nth 5 context))

(defun context/Ih (context) (nth 6 context))

(defun context/Ihc (context) (nth 0 (nth 6 context)))

(defun context/Ihs (context) (nth 1 (nth 6 context)))

(defun context/Ihi (context) (nth 2 (nth 6 context)))

(defun context/Ihd (context) (nth 3 (nth 6 context)))

(defun context/Ihl (context) (nth 4 (nth 6 context)))

(defun context/Ie (context) (nth 7 context))

(defun context/Iw (context) (nth 8 context))

(defun context/validp (context)
  (and (listp context)
       (equal (length context) 9)
       (listp (context/Id context))
       (address/validp (context/Is context))
       (wei/validp (context/Iv context))
       (block-header/validp (context/Ih context))))
