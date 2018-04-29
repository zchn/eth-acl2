
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-byte1 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "7f112233445566778899001122334455667788990011223344556677889900aabb60001a7f112233445566778899001122334455667788990011223344556677889900aabb60011a7f112233445566778899001122334455667788990011223344556677889900aabb60021a7f112233445566778899001122334455667788990011223344556677889900aabb60031a7f112233445566778899001122334455667788990011223344556677889900aabb60041a7f112233445566778899001122334455667788990011223344556677889900aabb60051a7f112233445566778899001122334455667788990011223344556677889900aabb60061a7f112233445566778899001122334455667788990011223344556677889900aabb60071a7f112233445566778899001122334455667788990011223344556677889900aabb60081a7f112233445566778899001122334455667788990011223344556677889900aabb60091a7f112233445566778899001122334455667788990011223344556677889900aabb600a1a7f112233445566778899001122334455667788990011223344556677889900aabb600b1a7f112233445566778899001122334455667788990011223344556677889900aabb600c1a7f112233445566778899001122334455667788990011223344556677889900aabb600d1a7f112233445566778899001122334455667788990011223344556677889900aabb600e1a7f112233445566778899001122334455667788990011223344556677889900aabb600f1a7f112233445566778899001122334455667788990011223344556677889900aabb60101a7f112233445566778899001122334455667788990011223344556677889900aabb60111a7f112233445566778899001122334455667788990011223344556677889900aabb60121a7f112233445566778899001122334455667788990011223344556677889900aabb60131a7f112233445566778899001122334455667788990011223344556677889900aabb60141a7f112233445566778899001122334455667788990011223344556677889900aabb60151a7f112233445566778899001122334455667788990011223344556677889900aabb60161a7f112233445566778899001122334455667788990011223344556677889900aabb60171a7f112233445566778899001122334455667788990011223344556677889900aabb60181a7f112233445566778899001122334455667788990011223344556677889900aabb60191a7f112233445566778899001122334455667788990011223344556677889900aabb601a1a7f112233445566778899001122334455667788990011223344556677889900aabb601b1a7f112233445566778899001122334455667788990011223344556677889900aabb601c1a7f112233445566778899001122334455667788990011223344556677889900aabb601d1a7f112233445566778899001122334455667788990011223344556677889900aabb601e1a7f112233445566778899001122334455667788990011223344556677889900aabb601f1a7f112233445566778899001122334455667788990011223344556677889900aabb60201a7f112233445566778899001122334455667788990011223344556677889900aabb6107de1a6000600055")
    ;; stack
    (mk-empty-stack)
    ;; mem
    (mk-empty-memory)
    ;; storage
    (mk-empty-storage)
    ;; halted
    nil
    ;; gas
    100000
    ;; context
  
    (mk-context
      ;; ia
      87579061662017136990230301793909925042452127430
      ;; io
      1170859069862169782511871033392474246841492526721
      ;; ip
      100000000000000
      ;; id
      nil
      ;; is
      1170859069862169782511871033392474246841492526721
      ;; iv
      1000000000000000000
      ;; ih
  
      (mk-block-header
        ;; ihc
        244687034288125203496486448490407391986876152250
        ;; ihs
        1
        ;; ihi
        0
        ;; ihd
        256
        ;; ihl
        1000000)
      ;; ie
       "<call/create stack height>"
      ;; iw
      "<permission>")
    ;; substate
  
    (mk-substate
      ;; suiside
      nil
      ;; log
      nil
      ;; touched
      nil
      ;; refund
      0)))

(defun env-with-pre-byte1 ()
    (mk-initial-env-byte1))

(defun env-with-post-byte1 ()
    (env/set-halted (mk-initial-env-byte1) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-byte1
  (expected-env-p (env/exec (env-with-pre-byte1))
                  (env-with-post-byte1)))