#lang planet neil/sicp

(define (sqrt x)
  (sqrt-iter x 1.0 x))

(define (sqrt-iter guess1 guess2 x)
  (if (relatively-small? (- guess1 guess2) x)
      guess1
      (sqrt-iter guess2
                 (improve guess2 x)
                 x)))

(define (relatively-small? a b)
  (< (abs (/ a b)) 0.001))

(define (square x) (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(sqrt 0.000001)