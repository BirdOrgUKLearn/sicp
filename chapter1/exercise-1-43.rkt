#lang planet neil/sicp

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (dec n)))))

(define (square x) (* x x))

((repeated square 2) 5)
((repeated square 3) 5)