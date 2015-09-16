#lang planet neil/sicp

(define (f g) (g 2))

(f (lambda (x) (* x x)))
(f (lambda (z) (* z (inc z))))
(f f)
; the interpreter must evaluate (2 2)
; that is not considered a valid expression so and error is thrown