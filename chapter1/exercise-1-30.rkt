#lang planet neil/sicp

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (cube x) (* x x x))
(define (sum-cubes a b)
  (sum cube a inc b))

(sum-cubes 1 10)

(define (sum-iter term a next b)
  (define (iter i total)
    (if (> i b)
        total
        (iter (next i) (+ total (term i)))))
  (iter a 0))

(define (sum-cube-iter a b)
  (sum-iter cube a inc b))
(sum-cube-iter 1 10)