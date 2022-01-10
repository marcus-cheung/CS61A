(define (filter-lst fn lst)
    (
    cond
          ((null? lst) nil) ;;checks basecase
            
         ((fn (car lst))
         (cons (car lst)(filter-lst fn (cdr lst))))  ;; checks if condition applies
            
        (else (filter-lst fn (cdr lst)))
            
    
    )
        )





(define (interleave first second) 
    (cond
        ((null? first)
            second
            )
        ((null? second)
            first
            )
        (else  ( cons (car first) (interleave second(cdr first)) ) ) 
            
        
        
        )
    )




(define (accumulate combiner start n term)
    (cond 
        ((= n 1) (term n))
        ((= start 0)(combiner (term n) (accumulate combiner 0 (- n 1) term)))
        (else(combiner start (combiner (term n) (accumulate combiner 0 (- n 1) term)) ))
    
    )
)


(define (without-duplicates lst)
  (cond
      ((null? lst)())
        
          (else(cons
          (car lst)
          (without-duplicates(filter-lst (lambda (x) (not(= x (car lst)))) (cdr lst)))
      ))
      
      )
)

(without-duplicates (list 5 4 5 4 2 2))
