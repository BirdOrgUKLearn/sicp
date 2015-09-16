#lang planet neil/sicp

(define (sqcb x)
  (sqcb-iter 1.0 x))

(define (sqcb-iter y x)
  (if (good-enough? y x)
      y
      (sqcb-iter (improve y x)
                 x)))

(define (good-enough? y x)
  (< (abs (- (cube y) x)) 0.001))

(define (cube x) (* x x x))

(define (improve y x)
  (/ (+ y y (/ x (* y y))) 3))

(sqcb 8)
(sqcb 27)