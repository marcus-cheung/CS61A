(define (tail-replicate x n) 
    (define (helper n lst)
    (if(= n 0)
            lst
            (helper(- n 1 ) (append lst (list x)))
            )
    )
    (helper n ())
    )

(define-macro (def func args body)
 `(define ,func (lambda ,args ,body))

  )

(define-macro (f x y) (+ x y))
(def f (x y) (+ x y))




(define (repeatedly-cube n x)
  (if (zero? n)
      x
      (let ( (y (repeatedly-cube (- n 1) x)) )
        (* y y y))))