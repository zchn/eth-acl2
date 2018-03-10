(in-package "ACL2")

;; The machine does not follow the standard von Neu- mann architecture. Rather
;; than storing program code in generally-accessible memory or storage, it is
;; stored separately in a virtual ROM interactable only through a specialised
;; instruction.

(defun mk-rom (opstring)
  (if (stringp opstring) opstring ""))

(defun rom/n (rom n)
  (subseq (* n 2) (* (1+ n) 2) rom))
