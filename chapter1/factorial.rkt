#lang planet neil/sicp

(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))


(define (factorial2 n)
  (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count)))

(factorial2 5)
