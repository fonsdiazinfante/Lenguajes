#lang racket

;; Fibbonaci

(define (Fib n)
  (cond
  [(= 1 n) 0]
  [(= 2 n) 1]
  [(/(+ (Fib (- n 1))(sqrt 5))2)]
  [else (+ (Fib(- n 2))(Fib(- n 1)))]))
 


;; ANSWER HEAD

(define (fibH n)
  (cond
  [(= 1 n) 0]
  [(= 2 n) 1]
    [else (+ (fibH(- n 2))(fibH(- n 1)))]))


(fibH 5)


;; ANSWER TAIL

(define (fibT n)
  (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter(+ a b) a (- count 1))))

(fibT 9)


