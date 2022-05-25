(define example 20)
(define times 10)

(define turn-abs
  (lambda (l1 l2 l3 l4 l5 l6 l7 l8 l9 l10)
    (l1 (list 3 4 5))
    ;loop for going through each of the lists
    (let loop ((times 10))
      ;checks if list reaches zero if so stop loop
      (if (= times 0)
        (display "End of Computations");if times equals 0 then the loop ends
        (begin (display (abs example));demonstrates that list is now represented diffrently than inside the origninal
        (newline)
        (loop (- times 1)))
        )
      )
    
    )
);end of abs value method? or class? find out later

(define (checkAbsL li1 li2 li3)
  (li1 (list 1 2 3 4))
  display li1
  )

;lists that I am going to test
(begin
  (define l1 (list 5 10 3))
  (define l2 (list 0))
  (define l3 (list -4 -5 9 19))
  (define l4 (list -3 2 45 10))
  (define l5 (list -25 10 -3))
  (define l6 (list ));empty list to make sure it reacts correctly
  (define l7 (list 30 -2 1))
  (define l8 (list 3 -3 -3))
  (define l9 (list 20 9 -8))
  (define l10 (list 2 300 45))
  )
