#lang planet neil/sicp

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (factorial n)
  (product identity 1 inc n))
(factorial 3)
(factorial 4)
(factorial 5)

(define (aprox-pi n)
  (define (term k) (/ (* k (+ k 2.0))
                      (* (inc k) (inc k))))
  (define (next k) (+ k 2.0))
  (* 4.0 (product term 2.0 next n)))

(aprox-pi 4)
(aprox-pi 20)
(aprox-pi 100)
(aprox-pi 1000)

(define (product-iter term a next b)
  (define (iter i total)
    (if (> i b)
        total
        (iter (next i) (* total (term i)))))
  (iter a 1))

(define (factorial-iter n)
  (product-iter identity 1 inc n))
(factorial-iter 3)
(factorial-iter 4)
(factorial-iter 5)
