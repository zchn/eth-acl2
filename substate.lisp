(in-package "ACL2")

;; A, the accrued substate is defined as the tuple of the suicides set
;; s, the log series l, the touched accounts t and the refunds r

(defun mk-substate (suicide log touched refund)
  (list suicide log touched refund))

(defun mk-dummy-substate () (mk-substate nil nil nil nil))
