#lang planet neil/sicp

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (avarage guess (/ x guess)))

(define (avarage x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square n)
  (* n n))

(define (sqrt_ x)
  (sqrt-iter 1.0 x))

(sqrt_ 9)
