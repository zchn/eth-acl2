(in-package "ACL2")

(include-book "std/alists/top" :dir :system)

(include-book "../env")
(include-book "../exec")

(defun frontstrip-zeros-in-list (l)
  (if (consp l)
      (if (equal (car l) 0)
          (frontstrip-zeros-in-list (cdr l))
          l)
      nil))

(defun backstrip-zeros-in-list (l) (rev (frontstrip-zeros-in-list (rev l))))

(defun backstrip-zeros-in-storage-by-keys (storage keys)
  (if (consp keys)
      (let* ((key (car keys))
             (stripped (backstrip-zeros-in-list (cdr (hons-get key storage)))))
        (backstrip-zeros-in-storage-by-keys
         (if (equal stripped nil)
             (hons-remove-assoc key storage)
             (hons-acons key stripped storage))
         (cdr keys)))
      storage))

(defun backstrip-zeros-in-storage (storage)
  (backstrip-zeros-in-storage-by-keys storage (alist-keys storage)))

(defun expected-env-p (actual-env expected-env)
  (and (env/validp actual-env)
       (env/validp expected-env)
       (equal (env/halted actual-env)
              (env/halted expected-env))
       (alist-equiv (backstrip-zeros-in-storage (env/storage actual-env))
                    (env/storage expected-env))))
