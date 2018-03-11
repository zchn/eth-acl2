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

(defun rom/n-byte-or-0 (rom n)
  (if (rom/has-n rom n) (rom/n-byte rom n) 0))

(defun rom/n-w-helper (rom n num-bytes)
  (if (zp num-bytes) 0
    (+ (* (rom/n-w-helper rom n (1- num-bytes)) 256)
       (rom/n-byte-or-0 rom (+ n (1- num-bytes))))))

(defun rom/n-w32 (rom n) (rom/n-w-helper rom n 4))

(defun rom/n-w256 (rom n) (rom/n-w-helper rom n 32))

(defun rom/datasize (rom)
  (/ (length rom) 2))
