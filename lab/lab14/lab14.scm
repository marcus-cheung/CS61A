(define (split-at lst n) 
    (define (helper lst index)

    )
    (cond
        ((< (length lst) n)(cons lst nil))
   
    )

)

(define (compose-all funcs) 
    (define (compose func1 func2)
        (lambda(x)(func1(func2 x)))
    )
    (cond ((= (length funcs) 3)
        (compose (car funcs)(cdr funcs)))
        (else (compose-all (list (compose (car funcs)(car(cdr funcs)))  (cdr funcs)  )))
    )
)
