;Alex Baronsky Spring '22 Assignment 4
;Write a program that implements a binary search tree (BST). Assume that a BST organizes integers and can’t contain duplicate values.

;Parts of the Tree
(define (tmp BST) (car BST));Acts as reading the Node/first value of list
(define (leftSide BST)(cadr BST));Read left branch/second value of list
(define (rightSide BST)(caddr BST));Read right branch/third value of list

;Check Emptiness
(define emptyList (lambda (BST) (null? BST)))

;constructor for Tree
(define (plantTree tmp left right)
  (list tmp left right))

;constructor for leaf and node, Used to construct BST when inserting into function
(define nodeShape (lambda (BST)
  (plantTree BST '() '())))

;Form shape of tree recursively for In and Post order
(define (formTree orderType listToEdit)
  (let loop ((listToEdit listToEdit);loop through list until all values are called into the intoTree function
              (BST '()))
              (if (null? listToEdit)
                    BST;if empty just return BST
                    (loop (cdr listToEdit)(intoTree orderType (car listToEdit) BST)))));send Tail of the list back and send the Head intoTree function

;Takes List of numbers and sorts into BST
(define (intoTree orderType value BST)
  (cond ((null? BST);if empty return empty BST
         (plantTree value '() '()));form of empty BST returned
        ((orderType value (tmp BST));recursive call
              (plantTree (tmp BST)
                        (intoTree orderType value (leftSide BST))
                        (rightSide BST)))
        ((orderType (tmp BST) value)
         (plantTree (tmp BST)
                   (leftSide BST)
                   (intoTree orderType value (rightSide BST))))
        (else BST)));else returns tree when done

;Form shape of InOrder--Does not iterate correctly?
(define (formTree2 listToEdit)
  (let loop ((listToEdit listToEdit)
              (BST '()))
              (if (null? listToEdit)
                    BST
                    (loop (cdr listToEdit)(inOrder (car listToEdit) BST)))))
;calling function for inOrder function
(define (inOrder value BST)
  (cond
    ((null? BST) '());if null return BST 
    (append;append sides of list together
     (inOrder (leftSide value));appends values in left subtree
              (list (tmp BST));returns first value of list as node
              (inOrder (rightSide value)))));appends values in right subtree


;Insert into Tree
(define  (insert in BST)
  (cond ((null? BST) (nodeShape in))
       ((= in(tmp BST))BST);If we find the exact number just return BST no change
       ((< in (tmp BST))
        (plantTree (tmp BST) (insert in (leftSide BST))
                   (rightSide BST)))
          (else (plantTree (tmp BST)
                           (leftSide BST)
                           (insert in (rightSide BST))))))

;Search Function for BST
(define (searchValue toFind BST)
  (cond
    ((null? BST) #f);if reach end of BST and still no result return false
    ((= toFind (tmp BST))#t);if value searched for is equal to the node then return true
               ((< toFind (tmp BST))(searchValue toFind (leftSide BST)));if value is less than the the node then it searches the left subtree
               (else (searchValue toFind (rightSide BST)))));if value is more than node then searches the right side of the subtree

;Find Root of Tree
(define (getRoot BST)
  (tmp BST))

;Print Left SubTree, returns all parts of the left subbranch not including the root
(define (leftTree BST)
  (cond
   ((null? BST) BST)
   (leftTree (leftSide BST))))

;Print Right SubTree, returns all parts of the right subbranch not including the root
(define (rightTree BST)
  (cond
    ((null? BST) BST)
    (rightTree (rightSide BST))))

;Pre-defined Tree transversals
;inOrder transversal
(define (inOrder BST)
  (cond ((null? BST) '());if empty return list
        (else (append
               (inOrder (leftSide BST));left subbranch "lower"
               (list (tmp BST));root node value of the BST
               (inOrder (rightSide BST))))));right subbranch "higher"
;preOrder
(define (preOrder BST)
  (cond ((null? BST) '())
        (else (append
               (list (tmp BST));"first value in BST"
               (preOrder (leftSide BST));left subranch
               (preOrder (rightSide BST))))));rightsubranch
;postOrder
(define (postOrder BST); largest to smallest value
  (cond ((null? BST) '())
        (else (append
               (postOrder (rightSide BST));right subbranch recursively called "larger values"
               (list (tmp BST))
               (postOrder (leftSide BST))))));left subbranch recursivly values calledd "lower values"

;TEST CASES
(define t '(3 4 9 2 1))
(define test '(1 4 2 6 3))
(define test1 '(40 (30 (20 () (25 () ())) ()) (60 () ())))
(define test2 '(12 (10 (7 () (9 () ())) ()) (19 () (21 () ()))))

;Get Left Subtree
(leftTree test1)
(leftTree test2)

;Get Right SubTree
(rightTree test1)
(rightTree test2)

;Return Root of tree
(getRoot test1)
(getRoot test2)

;Call Functions
;Inserting into a BST
(insert 10 test1);insert a value NOT in the BST
(insert 5 test2);insert a value already IN the BST

;Form Tree from list
(formTree < test);inOrder
(formTree > t);postOrder
(formTree > '());Return empty BST back

;Empty BST?
(emptyList test1)
(emptyList '());empty list check

;Inorder Return?
;(formTree2 test1);inOrder

;Searches within already defined BST
(searchValue 30 test1)
(searchValue 1 test2)

;inOrder
(inOrder test1)
(inOrder test2)

;preOrder
(preOrder test1)
(preOrder test2)

;postOder
(postOrder test1)
(postOrder test2)
