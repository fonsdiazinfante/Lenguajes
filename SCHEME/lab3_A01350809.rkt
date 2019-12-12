;;Alfonso Díaz Infante
;;A01350809

#lang racket
'------------------Deep_all_X--------------------------------
;;Function that will return true if all elements in the list are 'x'
(define (deep-all-x? forest number)
    (if (null? forest) 
      #t
      (and (deep-all-x-aux (first forest) number)
        (deep-all-x? (rest forest) number))))

(define (deep-all-x-aux tree number) ;;This is an auxiliary function that helps find if all the elements of the list are 'x'
  (if (list? tree)
    (deep-all-x? tree number)
    (cond
      [(= number tree) #t]
      [else #f])))

(deep-all-x? '(1 (1 1) 1(1 (1 1) 1)) 1)
(deep-all-x? '(1 (1 1) 1(1 (1 1) 1)) 2)
(deep-all-x? '(1 (1 1) 1(2 (1 1) 1)) 1)
'-------------------Deep_Forest-------------------------------
;;Deep Reverse
(define (deep-reverse forest)
  (deep-reverse-aux forest '()))


(define (deep-reverse-aux list result) ;; This function is an auxiliary function to reverse elements in list
  (if (null? list)
    result
    (if (list? (first list))
      (deep-reverse-aux (rest list) (cons (deep-reverse-aux (first list) '()) result))
      (deep-reverse-aux (rest list) (cons (first list) result)))))

(deep-reverse '(a(b(c d))e (f g)))
(deep-reverse '(a(b)e))
(deep-reverse '(a e))
'------------------Flatten--------------------------------
;;Flatten List
(define (flatten deeplist)
  (flatten-aux deeplist '()))


(define (flatten-aux deeplist flatlist) ;;This function is an auxiliary function that helps transform deeplist into flatlist
  (if (null? deeplist)
    flatlist
    (if (list? (first deeplist))
      (cons (first (flatten-aux (first deeplist) '()))
        (flatten (append-list (rest (first deeplist)) (rest deeplist))))
      (cons (first deeplist) (flatten-aux (rest deeplist) '())))))

(define (append-list listA listB) ;;This function will append two lists
  (cond
    [(empty? listA) listB]
    [else (append-list (all-but-last listA '())
      (cons (last-element listA) listB))]))

(define (last-element list) ;;This function will return the lists last element
  (cond
    [(empty? (rest list)) (first list)]
    [else (last-element (rest list))]))

(define (all-but-last list result_list) ;;This function will return the list without it's last element
  (cond
    [(empty? (rest list)) (invert result_list)]
    [else (all-but-last (rest list) (cons (first list) result_list))]))

(define (invert list) ;; This function will invert the elements in the list
  (invert-aux list '()))

(define (invert-aux list result_list) ;;This function is an auxiliary function to invert the list
    (cond
      [(empty? list) result_list]
      [else (invert-aux (rest list) (cons (first list) result_list))]))


(flatten '(a(b(c d))e (f g)))
(flatten '(b(c d)))
(flatten '(a(b (f g))))


'----------------Depth_of_tree--------------
;;Return the depth of a tree
(define (count-levels deeplist)
  (if (empty? deeplist)
    0
    (if (empty? (rest deeplist))
      1
      (+ 1 (count-aux(rest deeplist))))))

(define (count-aux deeplist)
  (if (empty? deeplist)
    0
    (max (count-levels(first deeplist)) (count-aux(rest deeplist)))))


(count-levels '(a(b(c) (d))(e (f) (g)(h)(i))))
(count-levels '(a(b(c) (d))(e (f) (g)(h)(i(j)))))
(count-levels '(a(b)))

'----------------Max_Arity---------------
;;Returns the max number of children from a single node of the tree
(define (count-max-arity list)
  (if (null? list)
      0
      (max (arity (first list))
         (count-max-arity (rest list)))))

(define (arity list)
 (if (list? list)
     (max (- (length list) 1) (count-max-arity (children list)))
     0))

(define (children list)
  (rest list))


(count-max-arity '(a(b(c) (d))(e (f) (g)(h)(i))))
(count-max-arity '(a(b (d))(e (f) (g)(h))))
(count-max-arity '(a(b(c) (d))(e (f))))