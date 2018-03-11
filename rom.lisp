(in-package "ACL2")

(include-book "std/strings/top" :dir :system)

;; The machine does not follow the standard von Neumann architecture. Rather
;; than storing program code in generally-accessible memory or storage, it is
;; stored separately in a virtual ROM interactable only through a specialised
;; instruction.

(defun mk-rom (opstring)
  (if (stringp opstring) opstring ""))

(defun rom/has-n (rom n)
  (and (<= 0 n) (< (* n 2) (length rom))))

(defun rom/n-opstring (rom n)
  (subseq rom (* n 2) (* (1+ n) 2)))

(defun rom/n-op (rom n)
  (rom/n-opstring rom n))

(defun rom/n-byte (rom n)
  (let* ((opstring (rom/n-opstring rom n))
         (val (str::strval16 opstring)))
    val))
