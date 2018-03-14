(in-package "ACL2")

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
                                       198704 198705 198706 198707 198708))
