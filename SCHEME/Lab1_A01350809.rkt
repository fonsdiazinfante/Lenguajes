#lang racket

#|Jose Alfonso Díaz-Infante
A0130809
|#

;;This function will take two parameters and multiply them, later that will be divided by two 

(define (triangle-area base height)
  (/(* base height)2))

(triangle-area 5 20)
(triangle-area 15 10)

;; This function will only recieve a variable, elevate it to the power of two and then add it to ten

(define (n-square i)
  (+(* i i)10))

(n-square 2)
(n-square 3)

#|This function will recieve a parameter, the parameter will be multiplied by itself, as if it were elevated to the
  power of two, then it will be multiplied by 0.5 and then added to twenty
|#

(define(half-n-square n)
  (+(* 1/2 (* n n))20))

 (half-n-square 10)
 (half-n-square 20)

;; This function will recieve one parameter and divide it, the result will then be subtracted by two

(define(half-n p)
  (- 2  (/ 1 p)))

(half-n 4)
(half-n 8)

#| This function will evaluate different options to see if the equation has 0, 1 or 2 solutions, it will go through
   all the options and choose the correct one|#


(define(solution x y z)
(cond
   [(> (* y y) (* 4 x z)) 2]
   [(= (* y y) (* 4 x z)) 1]
   [(< (* y y) (* 4 x z)) 0])
  )

(solution 1 0 -1)
(solution 2 4 2)
(solution 1 0 2)



