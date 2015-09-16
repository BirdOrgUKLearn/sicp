#lang planet neil/sicp

(define (cont-frac n d k)
  (define (iter i sum)
    (if (= i 0)
        sum
        (iter (dec i) (/ (n k) (+ (d k) sum)))))
  (iter k 0))

(define (euler-d i)
  (let ((rem (remainder i 3))
        (div (quotient i 3)))
    (if (= rem 2)
        (+ div div)
        1.0)))

(define e
  (+ 2
     (cont-frac (lambda (i) 1.0)
           euler-d
           100)))
e ; target 2.71828, is 2.618033