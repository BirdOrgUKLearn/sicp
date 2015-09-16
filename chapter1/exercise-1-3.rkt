#lang planet neil/sicp

(define (foo a b c)
  (define (square x) (* x x))
  (define (sum-of-squares x y)
    (+ (square x) (square y)))
  (cond ((and (<= a b) (<= a c)) (sum-of-squares b c))
        ((and (<= b a) (<= b c)) (sum-of-squares a c))
        (else (sum-of-squares a b))))

;> (foo 1 2 3)
;13
;> (foo 2 2 3)
;13
;> (foo 2 3 2)
;13
;> (foo 2 2 2)
;8
;> (foo 3 2 2)
;13
;> (foo 1 2 2)
;8
;> (foo 2 1 2)
;8
;> (foo 2 2 1)
;8