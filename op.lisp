(in-package "ACL2")

(include-book "stack")

(include-book "env")

(defun op/stopp (op) (equal op "00"))

(defun op/addp (op) (equal op "01"))

;; (defun op/ltp (op) (equal op "10"))

(defun op/iszerop (op) (equal op "15"))

;; (defun op/sha3p (op) (equal op "20"))

;; (defun op/addressp (op) (equal op "30"))

(defun op/calldatasizep (op) (equal op "36"))

;; (defun op/blockhashp (op) (equal op "40"))

;; (defun op/popp (op) (equal op "50"))

(defun op/mstorep (op) (equal op "52"))

(defun op/jumpip (op) (equal op "57"))

(defun op/push1p (op) (equal op "60"))

;; (defun op/push17p (op) (equal op "70"))

;; (defun op/dup1p (op) (equal op "80"))

;; (defun op/swap1p (op) (equal op "90"))

;; (defun op/log0p (op) (equal op "a0"))

;; (defun op/createp (op) (equal op "f0"))
