;Alexander Baronsky Part 2: List Editor

;Part One!
(define (removeOneAtom listIN atomIN)
      (if (null? listIN);check for empty list
        '()
        (if (list? (car listIN));is the first value is a list?
                (cons (removeOneAtom (car listIN) atomIN)(removeOneAtom(cdr listIN) atomIN));if true process the list
                (if (equal? atomIN (car listIN));if false, only taking observing the value of a single atom
                       (removeOneAtom (cdr listIN) atomIN);remove it from the list if equal to target
                       (cons (car listIN)(removeOneAtom (cdr listIN) atomIN))))));continue to next atom to see if same as target with recursive call
         
;Make a seprate function to handle sublist, should try to make usable for part one and two if able

;Part 2!
(define (replaceAtom listIn atomOne atomTwo)
  (if (null? listIN);if list is empty return empty list
      '()
      (if (list? (car listIN))
          (cons (replaceAtom(car listIN) atomOne atomTwo)(replaceAtom (cdr listIN) atomOne atomTwo))
          (if (equal? (car listIN) atomOne);checks to see if the atom is equal to target 
             (cons atomTwo (replaceAtom(cdr listIN) atomOne atomTwo));change atom if target is equal
             (cons (car listIN)(replaceAtom (cdr listIN) atomOne atomTwo))))));next atom since the target to replace is not equal
;construct list to return with replaced value
(define (changeTheAtom listIN atomOne atomTwo)
  (cons atomTwo (replaceAtom (cdr listIN) atomOne atomTwo)))

;Test Cases
(define a '(a b c d a c a a));test letters
(define b '((a b) c () d a c a a))
(define c '(((a (a) b) c () d a c a a)))
(define d '(a b c d a c (a ((a)))a a))
(define e '(c (a ((a b)) c) c c))
(define f '(1 40 32 4 5 4 (3 20 4 20)));test numbers
(define g '(4 5 (1 2 2 3)(3 4 5)))
(define h '(1 4 () 4 2 5 1 2 6))
(define i '(4 6 0 (((2 5 3 5 4)))))
(define j '(hello goodbye hello (see hello you hello (later))));test with words

(display"Removing a Atom:");most cases remove a, but it does not matter which atoms are being targeted
(newLine)
(removeOneAtom a 'a)
(removeOneAtom b 'a)
(removeOneAtom c 'a)
(removeOneAtom d 'a)
(removeOneAtom e 'a)
(removeOneAtom f '20)
(removeOneAtom g '4)
(removeOneAtom h '4)
(removeOneAtom j 'hello)
(display"Replacing a Atom:")
(newLine)
(replaceAtom a 'a 'b)
(replaceAtom b 'a 'b)
(replaceAtom c 'a 'b)
(replaceAtom d 'a 'b)
(replaceAtom e 'a 'b)
(replaceAtom f '3 '20)
(replaceAtom g '4 '2)
(replaceAtom h '2 '1)
(replaceAtom i '5 '1)
(replaceAtom j 'hello 'goodbye)
