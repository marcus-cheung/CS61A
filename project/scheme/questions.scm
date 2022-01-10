(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement

(define (zip pairs)
  (list (map car pairs) (map cadr pairs))
)

;; Problem 15
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 15
  (define (helper s index)
      (if (null? s)
          nil
          (cons (list index (car s)) (helper (cdr s) (+ index 1)) )
          )
      )
  (helper s 0)
  )
  ; END PROBLEM 15

;; Problem 16

;; Merge two lists LIST1 and LIST2 according to COMP and return
;; the merged lists.
(define (merge comp list1 list2)
  ; BEGIN PROBLEM 16
  (define (helper a b)
      (cond
          ( (null? a) b)
          ( (null? b) a)
          
          ( (comp (car a) (car b))
          (cons (car a) (helper (cdr a) b )
                  ))
          (else (cons (car b) (helper (cdr b) a )))
          
      )
  )
    (helper list1 list2)
)
  ; END PROBLEM 16


;; Problem 17

;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM 17
         expr
         ; END PROBLEM 17
         )
        ((quoted? expr)
         ; BEGIN PROBLEM 17
         expr
         ; END PROBLEM 17
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 17
           (cons form (cons params (map let-to-lambda body)))
           ; END PROBLEM 17
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 17
           (cons (list 'lambda (car(zip values)) (car(map let-to-lambda body))  ) (cadr(zip (map let-to-lambda values))))
           ; END PROBLEM 17
           ))
        (else
         ; BEGIN PROBLEM 17
         (cons (car expr) (map let-to-lambda (cdr expr)))
         ; END PROBLEM 17
         )))
(let-to-lambda '(let
                 ((a
                   1)
                  (b
                   2))
                 (+
                  a
                  b)))
