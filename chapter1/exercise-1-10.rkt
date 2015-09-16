#lang planet neil/sicp

(define (A x y)
  (cond ((= y 0 ) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

(A 1 10)
; (A 0 (A 1 9))
; (A 0 (A 1 9))
; (A 0 (A 0 (A 1 8)))
; (A 1 1) = 2
; (A 0 2) = 2 * 2 = 4
; (A 1 10) = 1024
; 2^10
(A 2 4)
; (A 1 (A 2 3))
; (A 1 (A 1 (A 2 2)))
; (A 1 (A 1 (A 1 (A 2 1))))
; (A 1 (A 1 (A 1 2)))
; (A 1 (A 1 4))
; (A 1 16) = 65536
; 2^2^2^2
(A 3 3)
; (A 2 (A 3 2))
; (A 2 (A 2 (A 3 1)))
; (A 2 (A 2 2))
; (A 2 4) = 65536
(A 0 10)
(A 1 11)
; (A 2 5)
; (A 1 (A 2 4))
; (A 1 65536)

; (A 2 6)
; (A 1 (A 2 5))
  
; (A 3 4)
; (A 2 (A 3 3))
; (A 2 65536)
; (A 1 (A 2 65535))

(define (f n) (A 0 n))
; computes 2 * n
(define (g n) (A 1 n))
; computes 2 ^ n
(define (h n) (A 2 n))
; computes 2 ^ 2 ^ 2 ^ ... ^ 2 (n times)