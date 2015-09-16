#lang planet neil/sicp

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (* (term a)
         (accumulate combiner null-value term (next a) next b))))

(define (factorial n)
  (accumulate * 1 identity 1 inc n))
(factorial 3)
(factorial 4)
(factorial 5)

(define (accumulate-iter combiner null-value term a next b)
  (define (iter i total)
    (if (> i b)
        total
        (iter (next i) (combiner total (term i)))))
  (iter a null-value))

(define (factorial-iter n)
  (accumulate-iter * 1 identity 1 inc n))
(factorial-iter 3)
(factorial-iter 4)
(factorial-iter 5)