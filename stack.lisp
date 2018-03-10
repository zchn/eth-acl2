(in-package "ACL2")

(defun mk-stack () nil)

(defun stack/push (stack v)
  (cons v stack))

(defun stack/popn (stack n)
  (if (zp n)
      stack
    (stack/popn (cdr stack) (1- n))))

(defun stack/n (stack n)
  (car (stack/popn stack n)))
