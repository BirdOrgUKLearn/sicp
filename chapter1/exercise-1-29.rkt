#lang planet neil/sicp


(define (integral f a b n)
  (define h (/ (- b a) n))
  (define (y-k k) (f (+ (* k h) a)))
  (define (sum-y k total)
    (if (= k n)
        total
        (sum-y (inc k)
               (+ total (* (if (even? k) 2 4) (y-k k))))))
  (* (/ h 3)
     (+ (y-k 0) (sum-y 1 0) (y-k n))))

(define (cube x) (* x x x))

(integral cube 0 1 3)
(integral cube 0 1 4)
(integral cube 0 1 100)