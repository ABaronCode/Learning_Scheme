;Alexander Baronsky Part 3: Bubble Sort

(define (SmallToBig restList);takes in length of list to see what atoms to sort
  (if (null?  (cdr restList));if we reached end of list
              restList
              (if (<(car restList)(cadr restList));if 1st value of list is smaller than 2nd value of list
                  (cons (car restList)(SmallToBig (cdr restList)));recursivly call process to go through rest then reconstruct 
                  (cons (cadr restList)(SmallToBig(cons (car restList)(cddr restList)))))));construct list with smaller number taking first slot over the rest
;cons puts to lists together
(define (sortBubbleOuter restList nextPart);takes in length of list and list
  (if (<= restList 1) 
      nextPart
      (sortBubbleOuter (- restList 1) (SmallToBig nextPart))));whole list is processed as for each atom

(define (useBubble listIN);use to call functions
  (if (null? listIn);null? to check if list is empty and handle as such
    '();if list is empty
    (sortBubbleOuter (length listIN) listIN)));decide to go through the Bubble Sort


;If lists wanted to be processed in file
(define l1 (list 5 10 3))
(define l2 (list 2))
(define l3 (list -4 -5 9 25 19 400 -19 0));to make sure I can make list as long as needed
(define l4 (list -3 2 45 10))
(define l5 (list -25 10 -3))
(define l6 (list ));empty list to make sure it reacts correctly
(define l7 (list 30 -2 1))
(define l8 (list 3 -3 -3))
(define l9 (list 20 9 -8))
(define l10 (list 2 300 45))
;Run tests
(Display "BubbleSort:")
(newLine)
(useBubble l1)
(useBubble l2)
(useBubble l3)
(useBubble l4)
(useBubble l5)
(useBubble l6)
(useBubble l7)
(useBubble l8)
(useBubble l9)
(useBubble l10)
