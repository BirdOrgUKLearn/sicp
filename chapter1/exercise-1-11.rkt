#lang planet neil/sicp

(define (f-rec n)
  (define (f-back i) (* i (f-rec (- n i))))
  (if (< n 3)
      n
      (+ (f-back 1) (f-back 2) (f-back 3))))

(f-rec 2)
(f-rec 3)
(f-rec 4)
(f-rec 5)
(f-rec 6)

(define (f-iter n)
  (define (next m3 m2 m1)
    (+ m3 m3 m3 m2 m2 m1))
  (define (iter i m3 m2 m1)
    (if (= i 0)
        m1
        (iter (dec i) m2 m1 (next m3 m2 m1))))
  (if (< n 3)
      n
      (iter (- n 2) 0 1 2)))

(f-iter 2)
(f-iter 3)
(f-iter 4)
(f-iter 5)
(f-iter 6)