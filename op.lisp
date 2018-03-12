(in-package "ACL2")

(include-book "stack")

(include-book "env")

(defun op/stopp (op) (equal op "00"))

(defun op/addp (op) (equal op "01"))

(defun op/mulp (op) (equal op "02"))

(defun op/subp (op) (equal op "03"))

(defun op/divp (op) (equal op "04"))

(defun op/expp (op) (equal op "0a"))

(defun op/ltp (op) (equal op "10"))

(defun op/gtp (op) (equal op "11"))

(defun op/eqp (op) (equal op "14"))

(defun op/iszerop (op) (equal op "15"))

(defun op/andp (op) (equal op "16"))

(defun op/orp (op) (equal op "17"))

(defun op/xorp (op) (equal op "18"))

(defun op/notp (op) (equal op "19"))

;; (defun op/sha3p (op) (equal op "20"))

;; (defun op/addressp (op) (equal op "30"))

(defun op/callerp (op) (equal op "33"))

(defun op/callvaluep (op) (equal op "34"))

(defun op/calldataloadp (op) (equal op "35"))

(defun op/calldatasizep (op) (equal op "36"))

;; (defun op/blockhashp (op) (equal op "40"))

;; (defun op/popp (op) (equal op "50"))

(defun op/mstorep (op) (equal op "52"))

(defun op/jumpp (op) (equal op "56"))

(defun op/jumpip (op) (equal op "57"))

(defun op/jumpdestp (op) (equal op "5b"))

(defun op/push1p (op) (equal op "60"))

(defun op/push4p (op) (equal op "63"))

;; (defun op/push17p (op) (equal op "70"))

(defun op/push32p (op) (equal op "7f"))

(defun op/dup1p (op) (equal op "80"))

(defun op/dup2p (op) (equal op "81"))

(defun op/swap1p (op) (equal op "90"))

(defun op/log0p (op) (equal op "a0"))
(defun op/log1p (op) (equal op "a1"))
(defun op/log2p (op) (equal op "a2"))
(defun op/log3p (op) (equal op "a3"))
(defun op/log4p (op) (equal op "a4"))

;; (defun op/createp (op) (equal op "f0"))
