#lang planet neil/sicp

(define tolerance 0.00001)
(define (average a b) (/ (+ a b) 2))
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess i)
    (display i) (display " ") (display guess) (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next (inc i)))))
  (try first-guess 1))

(define (x-to-x-root x)
  (fixed-point (lambda (y) (/ (log x) (log y)))
               2.0))
(x-to-x-root 1000) ; 34 iterations

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (x-to-x-root-damp x)
  (fixed-point (average-damp(lambda (y) (/ (log x) (log y))))
               2.0))
(x-to-x-root-damp 1000) ; 9 iterations
