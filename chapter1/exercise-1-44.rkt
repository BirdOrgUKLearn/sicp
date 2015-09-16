#lang planet neil/sicp

(define (smooth f dx)
  (lambda (x)
    (let ((fm (f (- x dx)))
          (fx (f x))
          (fp (f (+ x dx))))
      (/ (+ fm fx fp) 3.0))))

(define (square x) (* x x))
(define smooth-square (smooth square 1))
(smooth-square 1) ; (0 + 1 + 4) / 3 = 1.66
(smooth-square 2) ; (1 + 4 + 9) / 3 = 4.66
(smooth-square 3) 

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (dec n)))))

(define fix-smooth (lambda (f) (smooth f 1)))
(define (n-fold-smooth f n)
  ((repeated fix-smooth n) f))
(define 2-smooth-square (n-fold-smooth square 2))
(2-smooth-square 2) ; 1: 1.66, 4.66, 9.66 - 16 / 3 = 5.33

; how would I make repeated accept (smooth f dx) ?