#lang racket

; CSI 3120 Assignment 1 Question 1
; Student Name: Elad Tzemach
; Student Number: 7505407
; Student Email: etzem012@uottawa.ca

(define (swap v i j)
  (define temp (vector-ref v i))
  (vector-set! v i (vector-ref v j))
  (vector-set! v j temp))
 
(define (sift-down v start end)
  (let ((child (+ (* start 2) 1)))
    (cond
      ((> child end) 'done)
      (else
       (begin
         (and (and (<= (+ child 1) end)
                   (< (vector-ref v child) (vector-ref v (+ child 1))))
              (set! child (+ child 1)))
         (if (< (vector-ref v start) (vector-ref v child))
             (begin
               (swap v start child)
               (sift-down v child end))
             v))))))
(define (heapify v)
  (define (iter v start)
    (if (>= start 0)
        (begin (sift-down v start (- (vector-length v) 1))
               (iter v (- start 1)))
        'done))
  (iter v (quotient (- (vector-length v) 2) 2)))
 
(define (heapsort-helper v)
  (define (iter v end)
    (if (zero? end)
        v
        (begin
          (swap v 0 end)
          (sift-down v 0 (- end 1))
          (iter v (- end 1)))))
  (begin
    (heapify v)
    (iter v (- (vector-length v) 1))))

(define (heapsort v)
  (heapsort-helper (list->vector v)))