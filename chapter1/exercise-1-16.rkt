#lang planet neil/sicp

(define (even? n)
  (= (remainder n 2) 0))

(define (square x)
  (* x x))

(define (fast-expt b n)
  (define (iter ibit pb result)
    (define grow (square pb))
    (define travel-i (quotient ibit 2))
    (cond ((= ibit 0) result)
          ((even? ibit) (iter travel-i grow result))
          (else (iter travel-i grow (* pb result)))))
  (iter n b 1))

(fast-expt 2 4)
(fast-expt 2 5)
(fast-expt 2 10)
(fast-expt 2 20)
(fast-expt 3 20)