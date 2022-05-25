;Alex Baronsky Part 1: Absolute Values

(define absChange
  (lambda (x);variable that holds the called list
  (if (null? x)
      '();if list is empty, return an empty list
      (cons (abs(car x))(absChange (cdr x))))))
;first value is taken from list and taken as absolute
;recursivly call function to process remaining values
;cons takes each of the the values and reconstructs list

(define l1 (list 5 10 3))
(define l2 (list 2))
(define l3 (list -4 -5 9 19 25 400 -19 0));to make sure I can make list as long as needed
(define l4 (list -3 2 45 10))
(define l5 (list -25 10 -3))
(define l6 (list ));empty list to make sure it reacts correctly
(define l7 (list 30 -2 1))
(define l8 (list 3 -3 -3))
(define l9 (list 20 9 -8))
(define l10 (list 2 300 45))

;call the function for each list
(Display "Run Absolute Value ")
(newLine)
(absChange l1)
(absChange l2)
(absChange l3)
(absChange l4)
(absChange l5)
(absChange l6)
(absChange l7)
(absChange l8)
(absChange l9)
(absChange l10)