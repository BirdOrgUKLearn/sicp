#lang planet neil/sicp

(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
        (cond ((> (square test-divisor) n) n)
              ((divides? test-divisor n) test-divisor)
              (else (find-divisor n (inc test-divisor)))))
(define (divides? a b) (= (remainder b a) 0))
(define (square x) (* x x))
(define (prime? n)
  (= n (smallest-divisor n)))

(define (accumulate combiner null-value term a next b filter)
  (define (combine-if-valid total x)
    (if (filter x) (combiner total (term x)) total))
  (define (iter i total)
    (if (> i b)
        total
        (iter (next i) (combine-if-valid total i))))
  (iter a null-value))

(define (sum-primes a b)
  (accumulate + 0 square a inc b prime?))

(sum-primes 2 10) ; 2, 3, 5, 7; 4 + 9 + 25 + 49 = 87
(sum-primes 11 20) ; 11, 13, 17, 19; 121 + 169 + 289 + 361 = 940

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (sum-relative-prime n)
  (define (relative-prime? x)
    (= 1 (gcd x n)))
  (accumulate * 1 identity 2 inc n relative-prime?))

(sum-relative-prime 10) ; 1, 3, 7, 9; 3 * 7 * 9 = 189
