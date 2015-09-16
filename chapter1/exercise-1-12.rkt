#lang planet neil/sicp

(define (pascal i j)
  (if (or (= j 1) (= j i))
      1
      (+ (pascal (dec i) (dec j))
         (pascal (dec i) j))))

(pascal 1 1)
(pascal 2 1)
(pascal 2 2)
(pascal 3 2)
(pascal 4 2)
(pascal 4 3)
(pascal 5 4)
(pascal 5 3)