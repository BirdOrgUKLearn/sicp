#lang planet neil/sicp

(define (cont-frac n d k)
  (define (iter i sum)
    (if (= i 0)
        sum
        (iter (dec i) (/ (n k) (+ (d k) sum)))))
  (iter k 0))

(define (test k)
  (cont-frac (lambda (i) 1.0)
             (lambda (i) 1.0)
             k))
; target 0.6180
(test 4)
(test 8)
(test 11)
(test 100)

; point b) is uninteresting
