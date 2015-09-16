#lang planet neil/sicp

(define dx 0.00001)
(define (average a b) (/ (+ a b) 2))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) dx))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (dec n)))))

(define (average-damp f)
  (lambda (x) (average x (f x))))

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

(define (transform-for-x-to-n x n)
  ((repeated average-damp (round (/ (log n) (log 2)))) (lambda (y) (/ x (fast-expt y (dec n))))))

(define (root-n x n )
  (fixed-point (transform-for-x-to-n x n) 1.0))

(root-n 2 2) ; 1.41
(root-n 9 2) ; 3
(root-n 8 3) ; 2
(root-n 8 3) 
(root-n 16 4)
(root-n 32 5)
(root-n 64 6)
(root-n 128 7)
(root-n 256 8)
(root-n 512 9)
(root-n 1024 10)
(root-n 2048 11)
(root-n 4096 12)
(root-n 8192 13)
(root-n 16384 14)
(root-n 32768 15)
(root-n 65536 16)

(define (test-transform-for-x-to-n x n m)
  ((repeated average-damp m) (lambda (y) (/ x (fast-expt y (dec n))))))

(define (test-root-n x n m)
  (fixed-point (test-transform-for-x-to-n x n m) 1.0))

(test-root-n 8 3 1) 
(test-root-n 16 4 2)
(test-root-n 32 5 2)
(test-root-n 64 6 2)
(test-root-n 128 7 2)
(test-root-n 256 8 3)
(test-root-n 512 9 3)
(test-root-n 1024 10 3)
(test-root-n 2048 11 3)
(test-root-n 4096 12 3)
(test-root-n 8192 13 3)
(test-root-n 16384 14 3)
(test-root-n 32768 15 3)
(test-root-n 65536 16 4)