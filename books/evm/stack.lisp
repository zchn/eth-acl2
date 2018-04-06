(in-package "ACL2")

(include-book "base")

;; The word size of the machine (and thus size of stack items) is 256-bit. The
;; stack has a maximum size of 1024.

(defun mk-empty-stack () (list 'stack-bottom))

(defun stack/has-n (stack n)
  (and (natp n)
       (< n (1- (length stack)))))

(defund stack/validp (stack)
  (if (stack/has-n stack 0)
      (and (listp stack)
           (evm-w256p (car stack))
           (stack/validp (cdr stack)))
      (equal stack (mk-empty-stack))))

(defund stack/push (stack v)
  (if (evm-w256p v)
      (cons v stack)
      stack))

(defund stack/pop (stack)
  (if (equal stack (mk-empty-stack))
      stack
      (cdr stack)))

(defund stack/top (stack)
  (if (equal stack (mk-empty-stack))
      0
      (car stack)))

(defun stack/popn (stack n)
  (if (zp n)
      stack
      (stack/popn (stack/pop stack) (1- n))))

(defun stack/n (stack n)
  (stack/top (stack/popn stack n)))
