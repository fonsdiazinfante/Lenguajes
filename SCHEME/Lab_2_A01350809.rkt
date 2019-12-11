;;Alfonso Díaz Infante
;;A01350809

#lang racket

;;These two functions will elevate a number given by the user to the power of another number given by the user

;;Tail Recursion, does all the operations in one go
(define (powerThelper n p num) ;;this function is a helper function that recieves 3 parameters, the last one is to store a value
  (cond
    [(= p 0) num] ;;Until p gets to 0, the function will continue to do the operations
    [else (powerThelper n(- p 1)(* n num))])) ;; the helper function calls upon itself to continue the operations

(define (powerT n p) ;;this functions recieves onkly 2 parameters
(powerThelper n p 1) ;;it then pases those 2 parameters to the helper function with a 3rd value
  )


(define (powerHhelper n p num)
  (cond
    [(= p 0) num] ;; num will be returned once p reaches 0 and all the multiplications that are defined under are completed
    [else (* (powerHhelper n (- p 1)num)n)])) ;;This function will leave pending operations since it does not know the value of "num" until p reaches 0

(define (powerH n p)
(powerHhelper n p 1)
  )

(powerT 4 3)
(powerH 4 3)


(define (third list)
(first(rest(rest list)))
  )

(third (cons 'first(cons 'second(cons 'third empty))))



(define (just-two? list)
(cond [(eq?(length list)2)'true]
      [else 'false])
  )

(just-two? (cons 'first(cons 'third empty)))



;;-------------------------------

(define (how-many-x? list x)
 (how-many-x-help list x 0)
  )


(define (how-many-x-help list x num)
    (cond
        [(null? list) num]
        [(= (first list) x) (how-many-x-help (rest list) x (+ num 1))]
        (else (how-many-x-help (rest list) x num))))


(how-many-x? (cons 1(cons 2(cons 2(cons 2 empty) ) ) ) 2 )

;;------------------


(define (all-x? list)
  (cond
        [(null? list) 'true]
        [(eq? (first list) 'x) (all-x? (rest list))]
        (else 'false )))

(all-x? (cons 'x(cons 'x(cons 'x(cons 'x empty) ) ) ) )

;;-----------------------------

(define (get list i)
(cond
  [(= i 1) (first list)]
  [else (get (rest list) (- i 1))]))

(get (cons 'z(cons 'y(cons 'x empty))) 2)

;;-----------------


(define (addLast l x) ;;recieves a list then a value
  (cond
    [(empty? l)(cons x empty)] ;;adds the value to the last spot in the list
    [else (cons (first l)(addLast (rest l) x))]))

;; invert with dots
(define (inv l) ;;we get a list
  (cond
    [(empty? l) '()] ;;check if list is empty, if yes return empty, else
    [else (addLast (inv (rest l))(first l))])) ;;addLast is a pending operation so this is a head operation

(inv '(1 32 11 44 5 5 1 4 3))



;;--------------------

(define (difference A B)
(difference-maker A B '()))

(define (difference-maker A B C)
(cond
  [(empty? A ) C]
  [(iterator (first A) B) (difference-maker (rest A) B C)]
  [(difference-maker (rest A) B (cons (first A) C))] ) )

(define (iterator A B)
(cond
  [(empty? B) #f]
  [(= A (first B))#t]
  [else(iterator A (rest B))]))

(difference '(12 44 55 77 66 1 2 3 4)'(1 2 3))



(define (append A B)
  (cond
    [(empty? A) B]
    [else (cons (first A) (append (rest A) B))]))

(append '(a b c) '(a b c))



;;----------

(define (sign list)
  (sign-counter list '()))

(define (sign-counter list res)
(cond
 [(empty? list) res]
 [(< (first list) 0) (sign-counter (rest list) (append res (cons -1 empty)))]
 [else(sign-counter (rest list) (append res (cons  1 empty)))]))


(sign '(2 -4 6))

;;----
(define (negatives list)
  (negatives-maker list '()))

(define (negatives-maker list res)
(cond
 [(empty? list) res]
 [(< (first list) 0) (negatives-maker (rest list) (append res (cons (first list) empty)))]
 [else(negatives-maker (rest list) (append res (cons (* (first list) -1) empty)))]))


(negatives '(2 -4 6))










