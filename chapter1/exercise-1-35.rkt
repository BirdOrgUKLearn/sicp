#lang planet neil/sicp

(define tolerance 0.00001)
(define (average a b) (/ (+ a b) 2))
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))
(sqrt 2)
(sqrt 9)
(/ (+ 1 (sqrt 5)) 2)

; ro = (1 + sqrt(5)) / 2
; f(x) = 1 + 1 / x
; f(ro) = 1 + 2 / (1 + sqrt(5))
;       = 1 + 2 * (1 - sqrt(5)) / (1 - 5)
;       = 1 - (1 + sqrt(5)) / 2
;       = (1 + sqrt(5)) / 2
;       = ro

(define ro
  (fixed-point (lambda (x) (+ 1.0 (/ 1.0 x)))
               1.0))
ro 