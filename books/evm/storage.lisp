(in-package "ACL2")

;; The machine also has an independent storage model; this is similar in
;; concept to the memory but rather than a byte array, it is a word-
;; addressable word array.

(include-book "base")

(include-book "std/alists/top" :dir :system)

;; Type of a storage: ContractAddress => (WordOffset => WordValue)

(defun mk-empty-storage () nil)

(defun storage/validp (storage)
  ;; TODO(zchn): implement correct validp for storage.
  (declare (ignore storage))
  t)

(defun storage/load (storage address offset)
  (modfix-w256 (nth offset (hons-get address storage))))

(defun storage/store (storage address offset value)
  (hons-acons address
              (update-nth offset value (hons-get address storage))
              storage))
