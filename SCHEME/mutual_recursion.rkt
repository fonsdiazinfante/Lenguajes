#lang racket

;;mutual recursion
;;helper function to check if a node is at the bottom of the tree
(define (leaf? tree)
  (cond
  [(empty? (cdr tree ))true]
  [else false]))

;;helper function to get children of a node (which are the rest of the anidated list)
(define (children tree)
  (cdr tree))

;;first call explores the depth of the tree
(define (count-leaves tree)
  (if (leaf? tree)
      1
      (count-leaves-in-forest(children tree)))) ;; this function recieves the children and explores the width

(define (count-leaves-in-forest forest)
  (if (null? forest)
      0
      ;;This is where we explore the whole tree
      (+ (count-leaves (car forest)) ;; calls count-leaves to explore depth
         (count-leaves-in-forest (cdr forest))))) ;; recursive call unto itself to explore


(count-leaves '(a (b (c) (d)) (e (f) (g)))) ;;count the leaves

(define (add-nodes tree)
  (if (leaf? tree)
      (first tree)
      (+(add-nodes-in-forest (children tree))(first tree))))
  

(define (add-nodes-in-forest tree)
  (if (null? forest)
      0
      (+ (add-nodes (car forest))
      (add-nodes-in-forest (cdr forest)))))

(add-nodes '(1 (2)(3)))

