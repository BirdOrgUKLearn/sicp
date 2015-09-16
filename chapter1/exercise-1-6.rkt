#lang planet neil/sicp

; I guess that when calling new-if you evaluate both the if-clause
; and the else-clause - we pass the values, not the functions
; This triggers an infinite recursion where new-sqrt-iter is
; continuously called

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (new-sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (new-sqrt-iter (improve guess x)
                         x)))

(define (new-sqrt x)
  (new-sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (square x) (* x x))
(define (average x y)
  (/ (+ x y) 2))
(define (improve guess x)
  (average guess (/ x guess)))
