#lang planet neil/sicp

; does not work

(define (cont-frac n d k)
  (define (iter i sum)
    (if (= i 0)
        sum
        (iter (dec i) (/ (n k) (+ (d k) sum)))))
  (iter k 0))

(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= 1 i) x (- (* x x))))
             (lambda (i) (+ i i -1.0))
             k))
; x is radians
(tan-cf 1 100) ; target 1.5574
(tan-cf 0.5 1000) ; target 0.54630249
(tan-cf 0.25 1000) ; target 0.25534192
(tan-cf 0 1000) ; 0