(in-package "ACL2")

(include-book "base")

;; The word size of the machine (and thus size of stack items) is 256-bit. The
;; stack has a maximum size of 1024.

(defund mk-empty-stack () (list 'stack-bottom))

;; (defun stack/has-n (stack n)
;;   (and (natp n)
;;        (< n (1- (length stack)))))

(defund stack/top (stack)
  (if (equal stack (mk-empty-stack))
      0
      (car stack)))

(defund stack/pop (stack)
  (if (equal stack (mk-empty-stack))
      stack
      (cdr stack)))

(defund stack/push (stack v)
  (if (evm-w256p v)
      (cons v stack)
      stack))

(defund stack/validp (stack)
  (declare (xargs
            :hints (("Goal"
                     :in-theory (enable mk-empty-stack stack/top stack/pop)))))
  (and (listp stack)
       (> (length stack) 0)
       (or (equal stack (mk-empty-stack))
           (and (evm-w256p (stack/top stack))
                (stack/validp (stack/pop stack))))))

(defun stack/popn (stack n)
  (if (zp n)
      stack
      (stack/popn (stack/pop stack) (1- n))))

(defun stack/n (stack n)
  (stack/top (stack/popn stack n)))
