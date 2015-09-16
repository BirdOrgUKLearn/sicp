#lang planet neil/sicp

(define (double f) (lambda (x) (f (f x))))

((double inc) 2) ; 4
(((double (double double)) inc) 5) ; 21
